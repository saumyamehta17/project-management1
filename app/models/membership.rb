class Membership < ActiveRecord::Base
  attr_accessible :created_at, :user_id, :workspace_id, :owner_id

  with_options :presence => true do |valid|
  valid.validates :user_id 
  valid.validates :workspace_id 
  end

  belongs_to :user
  belongs_to :workspace
  belongs_to :invite_to, class_name: 'User', foreign_key: 'invite_to_id'

end
