class Doctor < ApplicationRecord
  attr_accessor :remember_token
  has_many :appointments
  has_many :hoac_users
  belongs_to :department
  #before_save { self.email = email.downcase }
  #before_save { self.name = name.downcase }
  validates :uid, presence: true, length: { minimum: 4 },
            numericality: true

 # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  #validates :email, presence: true, length: { maximum: 255 },
            #format: { with: VALID_EMAIL_REGEX},
            #uniqueness: { case_sensitive: false }
  #validates :mobile_number, :numericality => true

  has_secure_password
  validates :password, presence: true, length: { minimum: 6}, allow_nil: true


  #validates :status, presence: true
  #  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  #Returns the hash digest of the given string
  #this method is used to generate cookies for users
  def Doctor.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  #returns a random token
  #this method generate random base_64 strings
  def Doctor.new_token
    SecureRandom.urlsafe_base64
  end

  #Remembers a Doctor in the database for use in persistent sessions
  def remember_doctor
    self.remember_token = Doctor.new_token
    update_attribute(:remember_digest, Doctor.digest(remember_token))
  end

  #Returns true if the given token  matches the digest
  def authenticated?
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  #Forgets a Doctor
  def forget_doctor
    update_attribute(:remember_digest, nil)
  end


end
