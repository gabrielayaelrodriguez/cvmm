class Admin::DashboardController < Admin::BaseController
	before_action :authenticate_user!
  
	def index
	end
  
end