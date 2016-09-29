class HoacUsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :show] #this prevent users trying to access restricted
  #pages
  before_action :correct_user, only: [:edit, :update, :show] #prevent current user from editing others infos or see it
  before_action :find_user
  def index
    redirect_to signup_path
  end

   def show
   	 #@user = HoacUser.find(params[:id])
     @doctors = Doctor.all
   end
  def new
  	@user = HoacUser.new
  end

  def create
  	@user = HoacUser.new(user_params)
  	if @user.save
      log_in @user
  		flash[:success] = "Welcome to HoAc online appointments"
  		redirect_to @user
  	else
  		render 'new'
  	 end
  end

  def edit
  end

  def update
    if @user.update_attributes(edit_profile)
      flash[:success] = "Profile updated!"
      redirect_to @user
      else
        render 'edit'
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "User deleted"
    redirect_to current_user
  end


  #method below here are private
  private
  def user_params
  		params.require(:hoac_user).permit(:name, :email,
                                        :password, :password_confirmation)
  end

  def edit_profile
    params.require(:hoac_user).permit(:name, :city, :street,
                                      :first_name, :last_name,
                                      :mobile_number, :dob,
                                      :gender, :password, :password_confirmation)
  end

  def find_user
    @user = HoacUser.find(params[:id])
  end


  #confirm  a logged_in user
  def logged_in_user
    unless logged_in?
      store_url_destination
      flash[:danger] = "please log in."
      redirect_to login_path
    end
  end

  #confirm  the current user
  #take the login user to his and only edit profile
  def correct_user
    @user = HoacUser.find(params[:id])
    redirect_to(edit_hoac_user_path) unless current_user?(@user)
  end

  #confirm a user as an admin
  def admin_user
   redirect_to(root_url) unless correct_user.admin?    
  end


end
