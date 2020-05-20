class Notifications::LikeReplyService
  def initialize like
    @like = like
  end

  def perform
    ActivityNotification::Notification.notify :users, @like, key: "like.reply", notifier: @like.user, group: @like.post
    notification_targets(@like, "like.reply").each do |target_user|
      LikeReplyBroadcastJob.perform_later target_user
    end
  end

  private

  def notification_targets like, _key
    ([like.post.user] - [like.user]).uniq
  end
end
