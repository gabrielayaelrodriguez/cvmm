ENV.each { |k, v| env(k, v) }
# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
#set :output, 'log/cron.log'

set :output, 'log/cron.log'
#set :job_template, "/bin/bash -c \":job\""
set :environment, :development
#job_type :runner, "cd :path && script/rails runner -e :environment ':task' :output"

job_type :sidekiq, "cd :path && bundle exec sidekiq-client :task :output"

#every 1.minutes do
#	runner "User.send_report"
#end

every 1.minute do
	sidekiq "push HardWorker"
end

#every 1.minutes do
#	runner "HardWorker.perform_now"
#end

#every 1.minute do
#	command "cd :path && bundle exec sidekiq-client sidekiq-client push HardWorker"
#end