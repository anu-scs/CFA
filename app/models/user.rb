class User < ActiveRecord::Base
  attr_accessor :login
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  devise :omniauthable, :omniauth_providers => [:facebook, :twitter]
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :login, :firstname, :lastname, :username
  # attr_accessible :title, :body
  
  
  
  has_many :campaigns
  
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  
  # def self.find_for_oauth(auth)
      # user = User.new(name:auth.extra.raw_info.name,
                           # provider:auth.provider,
                           # uid:auth.uid,
                           # email:auth.info.email,
                           # password:Devise.friendly_token[0,20]
                           # )
  # end
  
  
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(name:auth.extra.raw_info.name,
                           provider:auth.provider,
                           uid:auth.uid,
                           email:auth.info.email,
                           password:Devise.friendly_token[0,20]
                           )
    end
    user
  end
  
  
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end  
  
end
