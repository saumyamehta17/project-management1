class Task < ActiveRecord::Base
  attr_accessible :assigned_to_id, :name ,:description, :status_id , :progress_id
  
  belongs_to :project
  belongs_to :assigned_to, class_name: 'User', foreign_key: 'assigned_to_id'
  belongs_to :status
  belongs_to :progress
  has_many :attachments
  
  with_options :presence => true do |task|
    task.validates :name  
    task.validates :description
 end

 with_options :uniqueness => true do |task|
    task.validates :progress_id
    task.validates :status_id
 end

 # before_save :create_new_attachments

 # def create_new_attachments
 #    @task.attachments.create(:document => @)
 # end





     
end
