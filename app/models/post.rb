class Post < ApplicationRecord
  scope :order_desc, ->{order created_at: :desc}
  belongs_to :user
  has_many :post_images, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :commented_users, through: :comments, source: :user

  has_many :post_hash_tags
  has_many :hash_tags, through: :post_hash_tags

  accepts_nested_attributes_for :post_images, allow_destroy: true,
    reject_if: proc{|attributes| attributes["image"].blank?}

  scope :create_desc, ->{order(created_at: :desc)}
  scope :user_posts, ->(id){where(user_id: id)}
  validates :user_id, presence: true

  validates :content, :title, :book_name, presence: true, allow_blank: false
  after_commit :create_hash_tags, on: :create

  def count_like
    # post = Post.find_by id: id
    # likes = post.likes
    likes.size
  end

  def self.search pattern
    if pattern.blank?
      all
    elsif (pattern.start_with?('#'))
      q = pattern.gsub('#', '')
      @posts = Post.eager_load(:hash_tags).where(hash_tags: {name: q})
    else
      where("book_name LIKE ?", "%#{pattern}%")
    end
  end

  def create_hash_tags
    extract_name_hash_tags.each do |name|
      hash_tags.create(name: name)
    end
  end

  def extract_name_hash_tags
    content.to_s.scan(/#\w+/).map{|name| name.gsub("#", "")}
  end
end
