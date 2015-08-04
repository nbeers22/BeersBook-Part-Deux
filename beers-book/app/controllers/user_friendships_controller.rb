class UserFriendshipsController < ApplicationController
	before_filter :authenticate_user!

	def index
		@user_friendships = current_user.user_friendships.all
	end
	
	def new
		if params[:friend_id]
			@friend = User.find(params[:friend_id])
			@user_friendship = current_user.user_friendships.new(friend: @friend)
		else
			flash[:error] = "Friend required"
		end
	rescue ActiveRecord::RecordNotFound
		render file: 'public/404', status: :not_found
	end

	def create
		if params[:user_friendship] && params[:user_friendship].has_key?(:friend_id)
			@friend = User.find(params[:user_friendship][:friend_id])
			@user_friendship = current_user.user_friendships.new(friend: @friend)
			@user_friendship.save
			flash[:success] = "You are now friends with #{@friend.first_name.titleize}!"
			redirect_to user_path(@friend)
		else
			flash[:error] = "Friend required"
			@user_friendship = current_user.user_friendships.new(friend: @friend)
		end
	end
end
