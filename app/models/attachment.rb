class Attachment < ActiveRecord::Base
  attr_accessible :document , :task_id

  IMAGE_TYPES = ["image/jpeg", "image/png", "image/jpg", "image/gif"]

  has_attached_file :document , :styles => lambda{ |a|
                                  # ["image/jpeg", "image/png", "image/jpg", "image/gif", "application/pdf"].include?( a.content_type ) ? {
                                  IMAGE_TYPES.include?( a.content_type ) ? {
                                  :thumb=> "100x100#",
                                  :thumbnail=> "60x60#",
                                  :small  => "150x150>",
                                  :medium => "300x300>",
                                  :large =>   "500x500>" }: {}
                                 }

  # { :medium => '300X300>' , :thumb => '100X100>'}
  # validates :document, :attachment_presence => true

  belongs_to :task
end
