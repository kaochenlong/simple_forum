class CommentsController < ApplicationController
  before_action :find_post, only: [:new, :create]
  before_action :find_comment, only: [:edit, :update, :destroy]

  def new
    @comment = @post.comments.new
  end

  def create
    @comment = @post.comments.new(comment_params)
    if @comment.save
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
  end

  private
  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
