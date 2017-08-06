# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
	def resources_email
		UserMailer.resources_email(User.last).deliver_now
	end
end
