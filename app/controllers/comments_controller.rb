class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_filter :set_group
  before_filter :set_post

  def create
   @comment = @post.comments.create(comment_params.merge(:user => current_user))
   redirect_to [@group, @post], notice: "Comment successful."
  end

  def destroy
   @comment = @post.comments.where(id: params[:id], :user_id => current_user)
   @comment.destroy
   redirect_to [@group, @post], notice: "Comment deleted."
  end

  private

  def set_group
    @group = current_user.membered_groups.find(params[:group_id])
  end

  def set_post
    @post = @group.posts.friendly.find(params[:post_id])
  end

  def comment_params
   params.require(:comment).permit(:body)
  end
end
