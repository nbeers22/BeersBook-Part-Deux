class CommentsController < ApplicationController
	before_action :find_comment, only: [:edit, :destroy]
	respond_to :html, :js
	
	def create
		@comment = Comment.create(post_params)
	end

	def new
		@comment = Comment.new
	end

	def destroy
		@comment.destroy
	end

	def update
		@comment.update_attributes(comment_params)
	end

	private

	def find_comment
		@comment = Comment.find(params[:post_id])
	end

	def comment_params
		params.require(:comment).permit(:body, :user_id)
	end
end
