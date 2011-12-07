# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
User.create! :name => "John Doe", :email => 'jhon.doe@ahdoc.com', :password => '123456';
User.create! :name => "eliphio", :email => "eliphio@ahdoc.com",  :password => "welcome"