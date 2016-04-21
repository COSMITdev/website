class BlogController < ApplicationController
  before_action :check_permission, only: :show
  before_action :set_locale

  def index
    @posts = Post.includes(:author).published.order(created_at: :desc)
  end

  def show
    @post = Post.includes(:author).find(params[:id])
    @next = @post.next
    @previous = @post.previous
  end

  def set_locale
    I18n.locale = :'pt-BR'
  end

  private

  def check_permission
    redirect_to posts_path unless admin_user_signed_in? || Post.find(params[:id]).published?
  end
end
