# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Status.create(:name => 'New')
  Status.create(:name => 'Ready')
  Status.create(:name => 'Hold')
  Status.create(:name => 'Done')

  
  
  10.times  do |n|
    Progress.create(:name => "#{(n+1)*10}")
  end 

