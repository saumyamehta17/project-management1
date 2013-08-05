class Reminder < ActiveRecord::Base
  attr_accessible :due_date, :name, :status, :user_id
  belongs_to :user
end
