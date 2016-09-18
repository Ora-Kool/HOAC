class HoacUser < ApplicationRecord
	before_save { self.email = email.downcase } #downcase the emails before saving them
	validates :name, presence: true, length: { maximum: 25 }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i #regular expression which is applied on email
	validates :email, presence: true, length: { maximum: 255 },
											format: { with: VALID_EMAIL_REGEX },
											uniqueness: { case_sensitive: false} # so that if there is 
																 #an existing email, flag error, and 
																 #let the email not case_sensitive
	has_secure_password #this is to ensure that users password is safe
						#this most have an attribute called password_digest
	validates :password, presence: true, length: { minimum: 6 }


end
