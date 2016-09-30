class AppointmentsController < ApplicationController
before_action :logged_in_user, only: [:create, :new]
before_action :find_patient, only: [:new, :create]

  def list
    @user = HoacUser.find(params[:id])
    @appointments = @user.appointments.all
  end

  def show
   @appointment = Appointment.find(params[:id])
  end

  def new
   @appointment = Appointment.new
   #@patient = HoacUser.find(params[:hoac_user_id] || params[:id])
  # @doctor = Doctor.find(params[:doctor_id] || params[:id])
  end

  def create
    @appointment = Appointment.new(appointments_params)
    if @appointment.save
      flash[:success] = "Appointment made!"
      redirect_to current_user
    else
        render 'new'
    end
  end

  private
  def appointments_params
    params.require(:appointment).permit(:name, :hoac_user_id, :doctor_id)
  end

def find_patient
  @patient = HoacUser.find(params[:hoac_user_id] || params[:id])
  @doctor = Doctor.find(params[:doctor_id] || params[:id])
end






  #confirm  the current user
  #take the login user to his and only edit profile
  #def correct_user
    #@user = HoacUser.find(params[:id])
    #redirect_to(edit_hoac_user_path) unless current_user?(@patient)
  #end

  #confirm  a logged_in user
  def logged_in_user
    unless logged_in?
      store_url_destination
      flash[:danger] = "please log in."
      redirect_to login_path
    end
  end
end
