class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :password, :password_confirmation, :cities_attributes
  
  validates_uniqueness_of :email
  has_many :reviews
  has_many :restaurants, :through => :reviews, :dependent => :destroy
  
  accepts_nested_attributes_for :restaurants

  def self.from_facebook_omniauth(auth)
    user = User.where(:email => auth[:info][:email]).first_or_initialize
    
    # create user with default password
    user.password = 'password'
    user.name = auth[:info][:first_name]
    user.save

    identity = Identity.where(:uid => auth[:uid]).first_or_initialize

    # assign identity attributes
    identity.user = user
    identity.provider = auth[:provider]
    identity.uid = auth[:uid]
    identity.login_name = auth[:info][:nickname]
    identity.image = "http://graph.facebook.com/#{auth[:uid]}/picture"
    identity.atoken = auth[:credentials][:token]
    identity.oauth_expires_at = Time.at(auth[:credentials][:expires_at])
    identity.save

    return user
  end
end
