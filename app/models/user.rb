class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username
  # attr_accessible :title, :body

  has_one :profile
  has_many :projects
  has_many :memberships
  has_many :workspaces , :through => :memberships

  after_create :profile_intialize
  after_create :workspace_intialize
  

  def profile_intialize
    create_profile
  end
  def workspace_intialize
    workspaces.create(:name => 'Personal')
  end
end
