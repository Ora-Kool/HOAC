class SessionsController < ApplicationController
  def new

  end
  def create
  	user = HoacUser.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		# log in the user
  		log_in user
  		redirect_to user
  	else
  		#render the login page again for the user to to try again
  		flash.now[:danger] = 'Invalid email/password combination!'
  	render 'new'
  end
  end

  def destroy
  	
  end
end
