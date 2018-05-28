class User < ApplicationRecord
  acts_as_voter
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :twitter, :vkontakte]

  has_many :posts

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do | user |
      user.email = provider_data.info.email
      user.first_name = provider_data.info.name
      user.last_name = ''
      user.password = Devise.friendly_token[0, 20]
      user.skip_confirmation!
    end
  end

  ROLES = %i[user admin reader writer]

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/avatar.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

end
