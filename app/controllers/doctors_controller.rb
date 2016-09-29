class DoctorsController < ApplicationController
  def new
    @doctor = Doctor.new
  end

  def dashboard
    @doctor = Doctor.find(params[:id])
    @appointments = @doctor.appointments.all
  end

  def profile
    @doctor = Doctor.find(params[:id])
  end




end
