class Relationship < ApplicationRecord
  belongs_to :follower, class_name: User.name
  belongs_to :followed, class_name: User.name
  validates :follower_id, presence: true
  validates :followed_id, presence: true
  acts_as_notifiable :users,
    targets: ->(relationship, _key){([active_relationship.followed]).uniq},
    notifiable_path: :user_notificable_path

  private

  def user_notificable_path
    user_path id: follower_id
  end
end
