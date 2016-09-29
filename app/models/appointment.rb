class Appointment < ApplicationRecord
  belongs_to :hoac_user
  belongs_to :doctor
end
