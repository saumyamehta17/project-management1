class Project < ActiveRecord::Base
  belongs_to :user
  has_many :tasks
  belongs_to :workspace
  attr_accessible :description, :name, :email , :desc

  validates :description  , :length => { :maximum => 50 }
end
