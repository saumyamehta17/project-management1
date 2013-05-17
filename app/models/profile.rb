class Profile < ActiveRecord::Base
  belongs_to :user
  attr_accessible :firstname, :lastname, :phoneno, :photo

  has_attached_file :photo , :styles => { :small => "40X40<" }
end
