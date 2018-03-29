# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Event.destroy_all
Location.destroy_all
User.destroy_all
Rsvp.destroy_all

ny = Location.create(name: "New York City")
bk = Location.create(name: "Brooklyn")
wb = Location.create(name: "Williamsburg, Brooklyn")
h = Location.create(name: "Harlem")
c = Location.create(name: "Manhattan")

z = User.create(username: "joe60", password_digest: "$2a$10$MrZWtvaPTExQi1SXGAZwEug0ACCXMZv1.WgZVy5vjCdgheatY3hVa", age: "27", email: "joe@gmail.com")
y = User.create(username: "york25", password_digest: "$2a$10$K1uZJqgBf1DxMq2tEMmEd.j.TQEI7AGscR3bJkLC0HuS8UNANcPZa", age: "27", email: "york@gmail.com")
cd = User.create(username: "cooldude5", password_digest: "$2a$10$TW1iYbFHpno5zIcJRgurn.J0g4709yoT8tFnSx3S8zPnVn0yyxHcm", age: "32", email: "cool@gmail.com")
j = User.create(username: "dudette25", password_digest: "$2a$10$GP8OkP0NITjOgT1MpEUAx.xxo09NiCoBATNZSkeylsx3bmCVSGlUG", age: "22", email: "dudette@gmail.com")

Event.create([
  {title: "My awesome bday!!!", category: "Birthday", max_guests: "30", date: DateTime.new(2018, 03, 15, 18, 00, 0), description: "Come on out for my bdayy, it's gonna be SWEET. BYO everything.",  location: ny, user: z},
  {title: "Dance party!!", category: "Dance Party", max_guests: "40", date: DateTime.new(2018, 04, 10, 00, 00, 0), description: "Bring your dancing shoes!", location: wb, user: y},
  {title: "SWEET concert", category: "Concert", max_guests: "50", date: DateTime.new(2018, 04, 20, 00, 00, 0), description: "VERY cool bands will be playing, trust me.", location: c, user: cd},
  {title: "Catan marathon!!", category: "Game Night", max_guests: "25", date: DateTime.new(2018, 04, 30, 00, 00, 0), description: "Come get your Settlers of Catan on. $1,000,000 first prize!!!", location: bk, user: j},
  {title: "Jaws screening...on the Hudson River!", category: "Movie Night", max_guests: "30", date: DateTime.new(2018, 04, 02, 00, 00, 0), description: "We will be screening jaws on our NEW floating screen! Come early to grab an inner tube to get out on the water for this immersive experience!", location: c, user: cd}
  ])

bday = Event.find_by(title: "My awesome bday!!!")
dance = Event.find_by(title: "Dance party!")
concert = Event.find_by(title: "SWEET concert")
game = Event.find_by(title: "Catan marathon!!")
movie = Event.find_by(title: "Jaws screening...on the Hudson River!")

Rsvp.create([
  {event: bday, user: y},
  {event: bday, user: j},
  {event: bday, user: cd},
  {event: concert, user: y},
  {event: concert, user: j},
  {event: concert, user: z},
  {event: game, user: z},
  {event: game, user: cd},
  {event: dance, user: j},
  {event: dance, user: z}
])
