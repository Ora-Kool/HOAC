class SessionsController < ApplicationController
  def new

  end
  def create
  	user = HoacUser.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      remember user
  		redirect_back_or user
  	else
  		#render the login page again for the user to to try again
  		flash.now[:danger] = 'Invalid email/password combination!'
  	render 'new'
  end
  end

  def destroy
    #this log_out call here is from the sessionhelper which has the called to forget from model
  	 log_out if logged_in?
     redirect_to root_path
  end
end
