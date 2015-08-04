class UserNotifier < ActionMailer::Base
  default from: "noreply@beersbook.com"

  def friend_requested(user_friendship_id)
  	user_friendship = UserFriendship.find(user_friendship_id)
  	@user = user_friendship.user 
  	@friend = user_friendship.friend

  	mail to: @friend.email,
  		subject: "#{@user.first_name.titleize} wants to be friends on BeersBook"
  end

  def friend_request_accepted(user_friendship_id)
  	user_friendship = UserFriendship.find(user_friendship_id)
  	@user = user_friendship.user 
  	@friend = user_friendship.friend

  	mail to: @user.email,
  		subject: "#{@friend.first_name.titleize} has accepted your friend request on BeersBook"
  end
end
