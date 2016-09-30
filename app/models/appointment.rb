class Appointment < ApplicationRecord
  belongs_to :hoac_user
  belongs_to :doctor
  default_scope -> { order(created_at: :desc) }
  validates :hoac_user_id, presence: true
  validates :doctor_id, presence: true
  validates :name, presence: true
end
