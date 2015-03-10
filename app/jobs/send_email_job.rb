class SendEmailJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    ReportMailer.report(args[0], args[1])
  end
end
