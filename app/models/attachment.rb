class Attachment < ActiveRecord::Base
  attr_accessible :document , :task_id

  has_attached_file :document , :styles => { :medium => '300X300>' , :thumb => '100X100>'}
  validates :document, :attachment_presence => true

  belongs_to :task
end
