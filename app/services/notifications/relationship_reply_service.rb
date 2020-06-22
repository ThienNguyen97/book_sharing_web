class Notifications::RelationshipReplyService
  def initialize relationship
    @relationship = relationship
  end

  def perform
    ActivityNotification::Notification.notify :users, @relationship, key: "relationship.reply", notifier: @relationship.follower
    notification_targets(@relationship, "relationship.reply").each do |target_user|
      RelationshipReplyBroadcastJob.perform_later target_user
    end
  end

  private

  def notification_targets relationship, _key
    ([active_relationship.followed]).uniq
  end
end
