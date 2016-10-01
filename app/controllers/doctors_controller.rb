class DoctorsController < ApplicationController
  #before_action :find_doctor
  before_action :logged_in_doctor, only: [:edit, :update, :dashboard]
  before_action :correct_doctor, only: [:edit, :update, :dashboard]


  #def index
    #@doctor = Doctor.find(params[:id])
    #@appointments  = @doctor.appointments.all
  #end
  def new
    @doctor = Doctor.new
    @department = Department.all.map{ |department| [department.department_name, department.id]}
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      log_in_doctor @doctor
      flash[:success] = "Welcome Doctor"
      redirect_to @doctor
    else
        render 'new'
    end
  end

  def dashboard
    @doctor = Doctor.find(params[:id])
    @appointments = @doctor.appointments.all
  end

  def profile
    @doctor = Doctor.find(params[:id])
  end

  def edit
    @doctor = Doctor.find(params[:id])
  end

  def update
    @doctor = Doctor.find(params[:id])
    if @doctor.update(doctor_update)
      flash[:success] = "Profile Updated!"
      redirect_to @doctor
    else
      render "edit"
    end
  end

  private
  def doctor_params
    params.require(:doctor).permit(:uid, :password, :password_confirmation, :department_id)
  end

  def doctor_update
    params.require(:doctor).permit(:department_id, :first_name, :last_name, :email)
  end

  def find_doctor
    @doctor = Doctor.find(params[:id])
  end

  #confirm  a logged_in user
  def logged_in_doctor
    unless logged_in_doctor?
      store_url_destination
      flash[:danger] = "please log in."
      redirect_to sign_in_path
    end
  end

  #confirm  the current user
  #take the login user to his and only edit profile
  def correct_doctor
    @doctor = Doctor.find(params[:id])
    if current_doctor?(@doctor)
    #redirect_to(edit_doctor_path) unless current_doctor?(@doctor)

    else
      flash[:danger] = "Invalid user"
      redirect_to sign_in_path
    end
  end

end
