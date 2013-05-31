class Profile < ActiveRecord::Base
  belongs_to :user
  attr_accessible :firstname, :lastname, :phoneno, :photo

  has_attached_file :photo , :styles => {  :medium => "300x300>", :thumb => "100x100>"}
end
