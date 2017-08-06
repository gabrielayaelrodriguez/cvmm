class HardWorker
  include Sidekiq::Worker

  def perform
    UserMailer.welcome_email.deliver_now
  end

  def self.send_mails
  #	user = User.last
  	self.perform_async
  end
end
