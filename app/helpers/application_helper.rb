# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

def followed?(user,the_user)
	Follow.find(:first,:conditions=>["user_id=? and the_followed_id=?",user.id,the_user.id])
end
end
