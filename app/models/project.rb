class Project < ActiveRecord::Base
  belongs_to :user
  has_many :tasks
  belongs_to :workspace
  attr_accessible :description, :name, :email , :desc

  validates :name, :presence => true
  before_save :capitalize_name

  def capitalize_name
	  self.name = self.name.capitalize
  end
  
end
