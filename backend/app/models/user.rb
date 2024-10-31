class User < ApplicationRecord
  devise :database_authenticatable, 
         :registerable, 
         :recoverable,
         :rememberable, 
         :validatable, 
         :omniauthable, 
         omniauth_providers: [:google_oauth2], 
         two_factor_authenticatable: true, 
         otp_secret_encryption_key: ENV['OTP_SECRET_ENCRYPTION_KEY']

  # Gere a chave OTP para cada usuário
  before_create :generate_otp_secret

  def generate_otp_secret
    self.otp_secret = User.generate_otp_secret
  end

  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
