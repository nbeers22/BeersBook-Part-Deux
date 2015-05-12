class PostsController < ApplicationController
	before_action :all_posts, only: [:index, :create, :update, :destroy]
	respond_to :html, :js
	skip_before_action :verify_authenticity_token

	def upvote
		@post = Post.find(params[:id])
		if current_user.id != @post.user_id
			unless @post.liked_by(current_user)
				@post.upvote_by(current_user)
			end
		end
	end

	def downvote
		@post = Post.find(params[:id])
		if current_user.id != @post.user_id
			unless @post.disliked_by(current_user)
				@post.upvote_by(current_user)
			end
		end
	end

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
		params.require(:post).permit(:content, :picture, :user_id)
	end

	def all_posts
	    @posts = Post.all
	end
end
