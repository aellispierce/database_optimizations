class ReportMailer < ApplicationMailer
  def report(address, name = "a1")
    @address = address
    @assembly = Assembly.find_by_name(name)
    @hits = @assembly.hits.order("percent_similarity DESC")
    File.open("#{Rails.root}/tmp/page- #{rand(1000000000)}", "w") do |file|
    	file << render_to_string(template: "report_mailer/report", layout: "mailer")
    mail(to: @address, subject: "Here is your report")
  end
end
