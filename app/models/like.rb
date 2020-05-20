class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
  acts_as_notifiable :users,
    targets: ->(like, _key){([like.post.user] - [like.user]).uniq},
    notifiable_path: :post_notificable_path

  private

  def post_notificable_path
    post_path id: post.id
  end
end
