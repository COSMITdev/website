class BlogController < ApplicationController
  before_action :check_permission, only: :show

  def index
    @posts = Post.includes(:author).published.order(created_at: :desc)
  end

  def show
    @post = Post.includes(:author).find(params[:id])
  end

  private

  def check_permission
    redirect_to posts_path unless admin_user_signed_in? || Post.find(params[:id]).published?
  end
end
