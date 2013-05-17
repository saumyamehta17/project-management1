class Task < ActiveRecord::Base
  belongs_to :project
  attr_accessible :assign_to, :name
end
