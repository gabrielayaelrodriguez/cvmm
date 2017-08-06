class HardWorker
  include Sidekiq::Worker

  def perform
  	users=User.where(admin: false)
  	users.each do |user|
    	UserMailer.resources_email(user).deliver_now
    end
  end

end
