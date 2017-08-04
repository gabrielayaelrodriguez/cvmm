class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :virtual_machines, dependent: :destroy

  after_create :queue_resources_email

  def self.from_omniauth(access_token)
      data = access_token.info
      user = User.where(email: data['email']).first

      # Uncomment the section below if you want users to be created if they don't exist
       unless user
           user = User.create(
              email: data['email'],
              password: Devise.friendly_token[0,20]
           )
       end
      user
  end

  def queue_resources_email
    UserMailer.welcome_email(self).deliver_now
  end
end
