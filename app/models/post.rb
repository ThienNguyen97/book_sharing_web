class Post < ApplicationRecord
  scope :order_desc, ->{order created_at: :desc}
  belongs_to :user
  #belongs_to :book
  has_many :post_images, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :commented_users, through: :comments, source: :user

  accepts_nested_attributes_for :post_images, allow_destroy: true,
    reject_if: proc{|attributes| attributes["image"].blank?}

  scope :create_desc, ->{order(created_at: :desc)}
  scope :user_posts, ->(id){where(user_id: id)}
  validates :user_id, presence: true

  validates :content, :title, :book_name, presence: true, allow_blank: false

  def count_like
    post = Post.find_by id: id
    likes = post.likes
    likes.size
  end

  def self.search pattern
    if pattern.blank?
      all
    else
      where("book_name LIKE ?", "%#{pattern}%")
    end
  end
end
