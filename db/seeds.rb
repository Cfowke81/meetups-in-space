# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Example:
#
#   Person.create(first_name: 'Eric', last_name: 'Kelly')

User.create(
  provider: "github",
  uid: "1",
  username: "jarlax1",
  email: "jarlax1@launchacademy.com",
  avatar_url: "https://avatars2.githubusercontent.com/u/174825?v=3&s=400"
)

User.create(
  provider: "github",
  uid: "2",
  username: "touchdowntommy12",
  email: "tbisdagreatest@hotmail.com",
  avatar_url: "http://dailysnark.com/wp-content/uploads/2016/09/tom-brady-ftr-twitter-061415_12r0mtmdc6qpj11a5ehe22q1uo.png"
)

User.create(
  provider: "github",
  uid: "3",
  username: "bojackrulez",
  email: "tecmochamp@yahoo.com",
  avatar_url: "http://gamelab.mit.edu/wp/wp-content/uploads/2013/03/bo_jackson_tecmo_bowl1.jpg"
)

User.create(
  provider: "github",
  uid: "4",
  username: "ceeplusplus",
  email: "rspectahdeck@gmail.com",
  avatar_url: "https://cms-assets.tutsplus.com/uploads/users/851/posts/26716/preview_image/RSpec-Testing-Red-with-Logo-small.jpg"
)

Event.create(
  name: "People who love their sports!",
  description: "A get together for fans of sports",
  location: "Pat's Tap",
  creator: "touchdowntommy12"
)

Event.create(
  name: "Let's play Tecmo Bowl!",
  description: "Fans of Tecmo Bowl, let's test our skills!",
  location: "Gordy's Gaming Emporium",
  creator: "touchdowntommy12"
)

Event.create(
  name: "A is for acceptance (testing)",
  description: "Let's practice acceptance testing",
  location: "Cathy's coding shack",
  creator: "jarlax1"
)

Attendee.create(
  event_id: "1",
  user_id: "2"
)

Attendee.create(
  event_id: "2",
  user_id: "2"
)

Attendee.create(
  event_id: "3",
  user_id: "1"
)

Attendee.create(
  event_id: "3",
  user_id: "3"
)

Attendee.create(
  event_id: "3",
  user_id: "4"
)

Attendee.create(
  event_id: "1",
  user_id: "1"
)

Attendee.create(
  event_id: "2",
  user_id: "3"
)

Attendee.create(
  event_id: "2",
  user_id: "4"
)
