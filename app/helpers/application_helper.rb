module ApplicationHelper
	def avatar_url(user)
		default_url = "#{root_url}images/fb.jpg" 
		gravatar_id = Digest::MD5.hexdigest(user.email).downcase
		return "http://gravatar.com/avatar/#{gravatar_id}.png?s=30"
	end

end


