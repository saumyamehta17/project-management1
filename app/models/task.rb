class Task < ActiveRecord::Base
  attr_accessible :assigned_to_id, :name ,:description, :progress ,:status
  belongs_to :project
  belongs_to :assigned_to, class_name: 'User', foreign_key: 'assigned_to_id'
  
  with_options :presence => true do |task|
    task.validates :name  
    task.validates :description
 end
     
end
