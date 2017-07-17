class User::DashboardController < User::BaseController
	before_action :authenticate_user!
  
	def index
	end
  
end