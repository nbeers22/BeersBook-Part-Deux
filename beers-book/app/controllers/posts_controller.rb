class PostsController < ApplicationController
	before_action :all_posts, only: [:index, :create]
	respond_to :html, :js

	def new
		@post = Post.new
	end

	def create
		@post = Post.create(post_params)
		@post.user = current_user if current_user
		@post.save
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		@post.update_attributes(post_params)
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
	end

	private

	def post_params
		params.require(:post).permit(:content, :user_id)
	end

	def all_posts
	    @posts = Post.all
	end
end
