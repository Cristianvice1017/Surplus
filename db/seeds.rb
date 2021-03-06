# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

2.times do |i|
	User.create(email: "user-#{i+1}@example.com", password: "password", password_confirmation: "password")
end

User.all.each do |u|
    u.profiles.create(phonenumber: "+12705642585", partnercode: "5469", firstname: "cristian", midname: "d", lastname: "vice", address: "LA-CA", unitnumber: "44", city: "LA", state: "CA", zipcode: "94105", sex: "m", birth: "1995-10-17", ssnortin: "okay")
end