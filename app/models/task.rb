class Task < ActiveRecord::Base
  attr_accessible :assigned_to_id, :name
  belongs_to :project
  belongs_to :assigned_to, class_name: 'User', foreign_key: 'assigned_to_id'
end
