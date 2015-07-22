class PostsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  before_action :set_group
  before_action :set_post, only: [:show, :edit, :update, :destroy]

 def index
   @posts = @group.posts.page(params[:page]).per(5)
 end

 def show
   @post = @group.posts.friendly.find(params[:id])
   @comment = Comment.new
 end

 def new
   @post = current_user.posts.new
 end

 def edit
   @post = @group.posts.friendly.find(params[:id])
 end

 def create
   @post = @group.posts.new(post_params.merge(:user => current_user))
     if @post.save
       redirect_to [@group, @post], notice: 'Post was successfully created.'
     else
       render :new
     end
 end

 def update
   if @post.update(post_params)
     redirect_to [@group, @post], notice: 'Post was successfully updated.'
   else
     render :edit
   end
 end

 def destroy
   @post.destroy
   redirect_to group_posts_url(@group), notice: 'Post was successfully destroyed.'
 end

 private
   def set_post
     @post = @group.posts.friendly.find(params[:id])
   end

   def set_group
     @group = current_user.membered_groups.find(params[:group_id])
   end

   def post_params
     params.require(:post).permit(:title, :body, :image, :all_tags)
   end
end
