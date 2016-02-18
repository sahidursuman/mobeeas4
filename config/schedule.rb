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
# =============================================================================
# THIS CRON JOB IS PARKED ASIDE NOW, PLEASE TOUCH THIS LATER IF YOU KNOW HOW TO:
# 1. Check that the subscription date is expiring less than 30 days from today
# 2. Send the notification email once to the user
# every :day, :at => '2:13 pm' do
# every 1.day, :at => '3:30 pm' do
  # runner "Subscription.expires_in_30_days", environment: :development
#  runner "Subscription.active_and_expires_in_30_days", :environment => "development"
#end
# ==============================================================================

# Learn more: http://github.com/javan/whenever
