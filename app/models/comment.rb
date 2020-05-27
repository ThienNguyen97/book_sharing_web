class Comment < ApplicationRecord
  scope :order_desc, ->{order created_at: :desc}
  belongs_to :user
  belongs_to :post

  validates :content, presence: true, allow_blank: false

  acts_as_notifiable :users,
    targets: ->(comment, _key){([comment.post.user] + comment.post.commented_users.to_a - [comment.user]).uniq},
    notifiable_path: :notificable_path

  private

  def notificable_path
    post_path id: post.id
  end
end
