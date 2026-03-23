class SendEmailJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "Sending email to 1"
  end
end
