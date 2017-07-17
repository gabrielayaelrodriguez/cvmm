class User::BaseController < ApplicationController
	before_action :verify_user

 private

	def verify_user
	  redirect_to root_url unless !(current_user.try(:admin?))
	end
end