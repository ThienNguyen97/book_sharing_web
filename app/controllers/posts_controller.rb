class PostsController < ApplicationController
  before_action :logged_in_user, except: %i(index show)
  before_action :load_post, only: %i(show edit update destroy)
  before_action :correct_user, only: :destroy
  before_action :load_support

  def index
    @posts = Post.order(:book_name).where("book_name like ?", "%#{params[:term]}%")
    # render json: @posts.map{|t| {label: t.book_name, value: t.id}}
  end

  def search
    @posts = Post.search(params[:q]) if params[:q]
  end

  def show
    @posts = Post.all.order_desc.page(params[:page]).per Settings.page_number
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params

    if @post.save
      params[:post_images]['image'].each do |a|
        @image = @post.post_images.create!(:link => a)
      end
      flash[:success] = t "post_success"
      redirect_to @post
    else
      render :new
    end
  end

  def update
    if @post.update_attributes(post_params)
      flash[:success] = t "update_success"
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:success] = t "destroy_success"
    redirect_to current_user
  end

  private

  def post_params
    params.require(:post).permit :user_id, :title, :content, :book_name, post_images_attributes: [:id, :post_id, :image].freeze
  end

  def load_post
    @post = Post.find_by id: params[:id]

    return if @post
    flash[:warrning] = t "post_not_found"
    redirect_to root_path
  end

  def correct_user
    @post = current_user.posts.find_by id: params[:id]
    redirect_to root_url if @post.nil?
  end

  def load_support
    @support = Supports::Posts.new post: Post.all, param: params
  end
end
