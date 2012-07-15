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
Setting.create(prompt: "Maximum speed", name: "Speed", value: 100)
Setting.create(prompt: "Amount of Emails Sent per Week", name: "Updates", value: 1)

Report.create(latitude: 42.37021284789698, longitude: -71.03965759277344, timestamp: '2012-06-27 17:22:00.000000')
Report.create(latitude: 42.354611507112295, longitude: -71.06128692626953, timestamp: '2012-06-22 17:22:00.000000')
Report.create(latitude: 42.341052318643335, longitude: -71.07622146606445, timestamp: '2012-06-25 17:22:00.000000')
Report.create(latitude: 42.34011654747233, longitude: -71.07512712478638, timestamp: '2012-06-24 17:22:00.000000')
Report.create(latitude: 42.34167087160251, longitude: -71.0676383972168, timestamp: '2012-06-24 17:22:01.000000')
Report.create(latitude: 42.33992621942814, longitude: -71.07416152954102, timestamp: '2012-06-22 17:22:03.000000')
Report.create(latitude: 42.33830840779254, longitude: -71.07094287872314, timestamp: '2012-07-26 17:22:01.000000')

Message.create(content: "This is a test message.")
Message.create(content: "Thank you for using Where's My Lane!")
Message.create(content: "abcdefghijklmnop qrs tu v x yz 1234567 890 -= ? !,.<> |")

u = User.new(email: "sammbeller@gmail.com", password: "admin00", password_confirmation: "admin00")
u.admin = true
u.save

r = User.new(email: "rachelburkhoff@gmail.com", password: "admin00", password_confirmation: "admin00")
r.admin = true
r.save