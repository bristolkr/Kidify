class CommentsController < ApplicationController
  before_action :require_authenticated_user, :only => [:destroy]
  def create
   @post = Post.friendly.find(params[:post_id])
   @comment = @post.comments.create(comment_params)
   redirect_to @post, notice: "Comment successful."
  end

  def destroy
   @post = Post.friendly.find(params[:post_id])
   @comment = @post.comments.find(params[:id])
   @comment.destroy

   redirect_to @post, notice: "Comment deleted."
  end

  private

  def comment_params
   params.require(:comment).permit(:user, :body)
  end
end
