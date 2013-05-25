class Workspace < ActiveRecord::Base
  attr_accessible :description, :name
  # has_many :projects
  has_many :memberships
  has_many :users , :through => :memberships
  has_many :projects

  # after_create :membership_intialize
  
  # def self.assignment(user)
  #   @use = user
  # end
    
  # def membership_intialize
  #   memberships.create(:user_id => @use)
  # end
end
