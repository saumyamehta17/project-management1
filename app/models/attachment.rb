class Attachment < ActiveRecord::Base
  attr_accessible :document , :task_id
  has_attached_file :document

  belongs_to :task
end
