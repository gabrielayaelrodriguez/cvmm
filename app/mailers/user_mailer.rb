class UserMailer < ApplicationMailer
	default from: 'notifications@cloudvmm.com'
	 
	  def resources_email(user)
	  	@user=user
	    mail(to: @user.email, subject: 'Weekly Resources Report')
	  end
end
