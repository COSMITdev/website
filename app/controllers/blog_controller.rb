class BlogController < ApplicationController
  before_action :check_permission, only: :show

  def index
    @posts = Post.published
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def check_permission
    redirect_to posts_path unless admin_user_signed_in? || Post.find(params[:id]).published?
  end
end
