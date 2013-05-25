class Project < ActiveRecord::Base
  belongs_to :user
  has_many :tasks
  belongs_to :wotkspace
  attr_accessible :description, :name, :email
end
