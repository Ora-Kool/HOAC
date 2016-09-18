class HoacUsersController < ApplicationController
   def show
   	 @user = HoacUser.find(params[:id])
   end
  def new
  	@user = HoacUser.new
  end

  def create
  	@user = HoacUser.new(user_params)
  	if @user.save
  		flash[:success] = "Welcome to HoAc online appointments"
  		redirect_to @user
  	else
  		render 'new'
  	 end
  end


  #method below here are private
  private
  def user_params
  		params.require(:hoac_user).permit(:name, :email, :password, :password_confirmation)
  end
end
