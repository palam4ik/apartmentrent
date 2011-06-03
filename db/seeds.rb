# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
unless User.find_by_email 'palam4ik@gmail.com'
  User.create :email => 'palam4ik@gmail.com', :password => '123456', :password_confirmation => '123456'
end

