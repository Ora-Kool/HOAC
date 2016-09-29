class DoctorsController < ApplicationController
  before_action :find_doctor

  def index
    @appointments  = @doctor.appointments.all
  end
  def new
    @doctor = Doctor.new
  end

  def dashboard
    @appointments = @doctor.appointments.all
  end

  def profile

  end

  def edit

  end

  def update
    if @doctor.update_attributes(doctor_params)
      flash[:success] = "Profile Updated!"
      redirect_to @doctor
    else
      render "edit"
    end
  end

  private
  def doctor_params
    params.require(:doctor).permit(:name)
  end

  def find_doctor
    @doctor = Doctor.find(params[:id])
  end

end
