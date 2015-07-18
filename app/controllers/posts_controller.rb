class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:index, :show]
 
 def index
   @posts = Post.page(params[:page]).per(5)
 end

 def show
   @post = Post.friendly.find(params[:id])
   @comment = Comment.new
 end

 def new
   @post = current_user.posts.new
 end

 def edit
   @post = Post.friendly.find(params[:id])
 end

 def create
   @post = current_user.posts.new(post_params)
     if @post.save
       redirect_to @post, notice: 'Post was successfully created.'
     else
       render :new
     end
 end

 def update
   if @post.update(post_params)
     redirect_to @post, notice: 'Post was successfully updated.'
   else
     render :edit
   end
 end

 def destroy
   @post.destroy
   redirect_to posts_url, notice: 'Post was successfully destroyed.'
 end

 private
   def set_post
     @post = Post.friendly.find(params[:id])
   end

   def post_params
     params.require(:post).permit(:title, :body, :image, :all_tags)
   end
end
