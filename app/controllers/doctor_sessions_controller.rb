class DoctorSessionsController < ApplicationController
  def new
  end

  def create
    doctor = Doctor.find_by(uid: params[:session][:uid])
    if doctor && doctor.authenticate(params[:session][:password])
      log_in_doctor doctor
      params[:session][:remember_me] == '1' ? remember_doctor(doctor) : forget_doctor(doctor)
      remember_doctor doctor
      redirect_back_or doctor
    else
      #render the login page again for the user to to try again
      flash.now[:danger] = 'Invalid UID/password combination!'
      render 'new'
    end
  end

  def destroy
    #this log_out call here is from the sessionhelper which has the called to forget from model
    log_out_doctor if logged_in_doctor?
    redirect_to root_path
  end
end
