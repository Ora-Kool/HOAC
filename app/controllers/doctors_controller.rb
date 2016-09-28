class DoctorsController < ApplicationController
  def new
    @doctor = Doctor.new
  end

  def dashboard
    @doctor = Doctor.find(params[:id])
  end


end
