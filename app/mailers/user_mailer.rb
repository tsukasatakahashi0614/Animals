class UserMailer < ApplicationMailer
  
  def welcome_email
    @user = params[:user]
    @url = "http://35.75.199.157/users/password/new"
    
    
  end
  
end
