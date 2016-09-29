module DoctorSessionsHelper
  # Logs in the given user.
  def log_in_doctor(doctor)
    session[:doctor_id] = doctor.id
  end

  # Remembers a user in a persistent session.
  def remember_doctor(doctor)
    doctor.remember_doctor
    cookies.permanent.signed[:doctor_id] = doctor.id
    cookies.permanent[:remember_token] = doctor.remember_token
  end

  # Returns true if the given user is the current user.
  def current_doctor?(doctor)
    doctor == current_doctor
  end

  # Returns the user corresponding to the remember token cookie.
  def current_doctor
    if (doctor_id = session[:doctor_id])

      @current_doctor ||= Doctor.find_by(id: doctor_id)

    elsif (doctor_id = cookies.signed[:doctor_id])

      doctor = Doctor.find_by(id: doctor_id)

      if doctor && doctor.authenticated?(cookies[:remember_token])

        log_in_doctor doctor

        @current_doctor = doctor
      end
    end

  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in_doctor?
    !current_doctor.nil?
  end

  #here i forget a persistent session
  def forget_doctor(doctor)
    doctor.forget_doctor
    cookies.delete(:doctor_id)
    cookies.delete(:remember_token)
  end
  # Logs out the current user.
  def log_out_doctor
    forget_doctor(current_doctor)
    session.delete(:doctor_id)
    @current_doctor = nil
  end

  #friendly forwording
  #redirects to stored location (or to the default)
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  #Store the  URL trying  to be accessed
  def store_url_destination
    session[:forwarding_url] = request.original_url if request.get?
  end

end
