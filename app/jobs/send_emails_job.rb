class SendEmailsJob < ApplicationJob
  queue_as :default

  def perform
  	UserMailer.welcome_email.deliver_now
    # Do something later

    File.open('myfile.out', 'w') { |f|
      f.puts "Hello, world."
    }

    #HardWorker.perform_async
  end
end
