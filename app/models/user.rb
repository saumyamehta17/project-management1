class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :provider, :uid, :name
  # attr_accessible :title, :body
  devise :omniauthable, :omniauth_providers => [:facebook]

  validates :username, :uniqueness => true
  has_one :profile
  has_many :projects
  has_many :memberships
  has_many :workspaces , :through => :memberships
  has_many :reminders

  after_create :profile_intialize
  after_create :workspace_intialize
  

  def profile_intialize
    create_profile
  end

  def workspace_intialize
    default_workspace = workspaces.create(:name => 'Personal')
    memberships.create(:workspace_id => default_workspace)
  end
  
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
