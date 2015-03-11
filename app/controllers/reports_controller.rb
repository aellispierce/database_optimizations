class ReportsController < ApplicationController
  def all_data
    @assemblies = Assembly.all
  end

  def send_email
     SendEmailJob.perform_later(params[:email], params[:assembly][:name])
     redirect_to root_path, notice: "Email sent!"
  end
end
