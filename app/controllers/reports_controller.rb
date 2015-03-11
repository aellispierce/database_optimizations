class ReportsController < ApplicationController
  def all_data
    @assemblies = Assembly.all
  end

  def send_email
     SendEmailJob.perform_later(params[:email], params[:assembly][:name])
     save_record(params[:assembly][:name])
     redirect_to root_path, notice: "Email sent!"
  end

  def save_record(record_name)
  	assembly= Assembly.find_by_name(record_name)
    File.open("#{Rails.root}/tmp/page- #{rand(1000000000)}", "w") do |file|
    	file << render_to_string(template: "report_mailer/report", layout: "mailer", :locals => {:@assembly => assembly, :@hits => assembly.hits})
    end
  end
end
