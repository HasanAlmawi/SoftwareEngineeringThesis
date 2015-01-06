require 'identicon'
module UsersHelper
	#Returns the identicon for the given user
	def identicon_for(user)
		####This is the code for gravatars
		#gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		#gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}.png"
		#image_tag(gravatar_url, alt: user.name, class: "gravatar")
		
		#This is the code for identicons
		identicon_url = Identicon.data_url_for user.email, 50, [255,255,255]
		image_tag(identicon_url)
	end		
end