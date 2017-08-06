set :output, 'log/cron.log'

set :environment, :development

every :sunday, :at => '12pm' do
	runner "HardWorker.perform_async"
end