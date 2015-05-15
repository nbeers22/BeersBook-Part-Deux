class CommentsController < ApplicationController
	before_action :find_post_and_comments, only: [:edit, :destroy]
	respond_to :html, :js
	
	def create
		@post = Post.find(params[:post_id])
		@comment = Comment.create(post_params)
		@comment.post = @post
		@comment.user = current_user
		@comment.save
	end

	def new
		@post = Post.find(params[:post_id])
		@comment = Comment.new
	end

	def destroy
		@comment.destroy
	end

	def update
		@comment.update_attributes(comment_params)
	end

	private

	def find_post_and_comments
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:post_id])
	end

	def comment_params
		params.require(:comment).permit(:body, :post_id, :user_id)
	end
end
