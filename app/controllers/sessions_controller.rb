class SessionsController < ApplicationController
  def new
  end

  def create
  	user_email =params[:session][:email]
  	user =User.find_by(email: user_email)
  	if user && user.authenticate(params[:session][:password])
      log_in user
  		redirect_to '#about'
  	else
  		flash[:danger]="Email or Password Incorrect."
  		render 'new'
  	end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
