# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#Settings

Setting.create(prompt: "Number of Reports to become trusted user", name: "NumReports", value: 3)
Setting.create(prompt: "Amount of Updates displayed", name: "HomepageView", value: 10)

puts Setting.count
puts "*********************111111"
Report.create(latitude: 42.37021284789698, longitude: -71.03965759277344, timestamp: '2012-06-27 17:22:00.000000')
Report.create(latitude: 42.354611507112295, longitude: -71.06128692626953, timestamp: '2012-06-22 17:22:00.000000')
puts "*********************222222"
puts Report.count