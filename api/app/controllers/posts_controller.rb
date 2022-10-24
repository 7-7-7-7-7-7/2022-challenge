class PostsController < ApplicationController
  def index
    @posts = Post.all
    render json: @posts
  end

  def show
    @post = Post.find(params[:id])
    render json: @post
  end

  def create
    @post = Post.create(
      name: params[:name],
      description: params[:description]
    ).save
    render json: @post
  end

  def update
    @post = Post.find(params[:id])
    @post.update(
      name: params[:name],
      description: params[:description]
    )
    render json: @post
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    render json: @post
  end

  private

  def post_params
    params.require(:post).permit(:name, :description)
  end
end