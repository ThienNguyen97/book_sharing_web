class StaticPagesController < ApplicationController
  before_action :get_feeds, only: :home
  def home
      # @posts = Post.all
    @posts = Post.all.order_desc.page(params[:page]).per Settings.paginate_post
    # @top_users = User.all.sort_by(&:count_getted_like).reverse.take(5)
    @top_posts = Post.eager_load(:likes).sort_by(&:count_like).reverse.take(20)
    # eager_load(:likes).size.order_desc.page(params[:page]).per Settings.paginate_post
  end

  private

  def get_feeds
    return unless user_signed_in?
    @item = current_user.feed.order_desc
    @feed_items = @item.page(params[:page]).per Settings.paginate_post
  end
end
