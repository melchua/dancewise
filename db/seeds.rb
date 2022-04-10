# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# Users, Dance Styles, Artists, Events, Event Types, Event Frequencies

User.destroy_all
DanceStyle.destroy_all
Artist.destroy_all
Event.destroy_all
EventType.destroy_all
EventFrequency.destroy_all

# USER CREATION

User.create(
    username: "ogarocious", 
    email:"ogarocious@me.com", 
    password:"password", 
    admin:true
)

User.create(
    username: "melchua", 
    email: "mchuam@gmail.com", 
    password:"password", 
    admin:true
)

4.times do
    user = User.new(
        username: Faker::Name.name,
        email: Faker::Internet.email,
        password: "password"
    )
    user.save
end

# DANCE STYLE CREATION

DanceStyle.create(name: "Salsa")
DanceStyle.create(name: "Bachata")
DanceStyle.create(name: "Kizomba")
DanceStyle.create(name: "Lindy Hop")
DanceStyle.create(name: "West Coast Swing")
DanceStyle.create(name: "Tango")
DanceStyle.create(name: "Urbankiz")
DanceStyle.create(name: "Fusion")
DanceStyle.create(name: "Blues")
DanceStyle.create(name: "Pole Dancing")
DanceStyle.create(name: "Hip-Hop")
DanceStyle.create(name: "Ballet")
DanceStyle.create(name: "Twerk")
DanceStyle.create(name: "Sexy Heels")
DanceStyle.create(name: "Brazilian Zouk")

# EVENT TYPE CREATION

EventType.create(name: "Festival")
EventType.create(name: "Congress")
EventType.create(name: "Weekender")
EventType.create(name: "Social")
EventType.create(name: "Retreat")
EventType.create(name: "Competition")
EventType.create(name: "Workshop")

# EVENT FREQUENCY CREATION

EventFrequency.create(name: "One-Time")
EventFrequency.create(name: "Annual")
EventFrequency.create(name: "Monthly")
EventFrequency.create(name: "Weekly")
EventFrequency.create(name: "Every Two Weeks")

# EVENT CREATION

Event.create(
    user_id: 1,
    name: "Salsa Event Test 1",
    description: "Awesome Salsa Event in Toronto",
    image_url: "imageplaceholder123456",
    event_type_id: rand(1..7),
    event_frequency_id: rand(1..5),
    event_date: Faker::Date.between(from: '2014-01-02', to: '2022-03-25')
)

EventDanceStyle.create(event_id: 1, dance_style_id: 1)


Event.create(
    user_id: 1,
    name: "Tango Test Event",
    description: "Awesome Tango Event in Dubai",
    image_url: "imageplaceholder123456",
    event_type_id: rand(1..7),
    event_frequency_id: rand(1..5),
    event_date: Faker::Date.between(from: '2014-01-02', to: '2022-03-25')
)

EventDanceStyle.create(event_id: 2, dance_style_id: 6)

Event.create(
    user_id: 1,
    name: "Bachata Test Event 1",
    description: "Awesome Bachata Event in Dublin",
    image_url: "imageplaceholder123456",
    event_type_id: rand(1..7),
    event_frequency_id: rand(1..5),
    event_date: Faker::Date.between(from: '2014-01-02', to: '2022-03-25')
)

EventDanceStyle.create(event_id: 3, dance_style_id: 2)

Event.create(
    user_id: 2,
    name: "Fusion Event Test 1",
    description: "Awesome Fusion Event in Medellin",
    image_url: "imageplaceholder123456",
    event_type_id: rand(1..7),
    event_frequency_id: rand(1..5),
    event_date: Faker::Date.between(from: '2014-01-02', to: '2022-03-25')
)

EventDanceStyle.create(event_id: 4, dance_style_id: 8)

Event.create(
    user_id: 2,
    name: "Zouk Event Test 1",
    description: "Awesome Zouk Event in Paris",
    image_url: "imageplaceholder123456",
    event_type_id: rand(1..7),
    event_frequency_id: rand(1..5),
    event_date: Faker::Date.between(from: '2014-01-02', to: '2022-03-25')
)

EventDanceStyle.create(event_id: 5, dance_style_id: 15)

Event.create(
    user_id: 2,
    name: "Urbankiz Event Test 1",
    description: "Awesome Urbankiz Event in Amsterdam",
    image_url: "imageplaceholder123456",
    event_type_id: rand(1..7),
    event_frequency_id: rand(1..5),
    event_date: Faker::Date.between(from: '2014-01-02', to: '2022-03-25')
)

EventDanceStyle.create(event_id: 6, dance_style_id: 7)

Event.create(
    user_id: 2,
    name: "Lindy Hop Event Test 1",
    description: "Awesome Lindy Hop Event in Harlem",
    image_url: "imageplaceholder123456",
    event_type_id: rand(1..7),
    event_frequency_id: rand(1..5),
    event_date: Faker::Date.between(from: '2014-01-02', to: '2022-03-25')
)

EventDanceStyle.create(event_id: 7, dance_style_id: 4)

Event.create(
    user_id: 1,
    name: "WCS Event Test 1",
    description: "Awesome WCS Hop Event in Boston",
    image_url: "imageplaceholder123456",
    event_type_id: rand(1..7),
    event_frequency_id: rand(1..5),
    event_date: Faker::Date.between(from: '2014-01-02', to: '2022-03-25')
)

EventDanceStyle.create(event_id: 8, dance_style_id: 5)

# ARTIST CREATION 

Artist.create(
    name: "Charles Ogar",
    description: "Urbankiz Instructor Based in Texas",
    image_url: "imageplaceholder123456",
    instructor: true
)

ArtistDanceStyle.create(artist_id: 1, dance_style_id: 7)
EventArtist.create(artist_id: 1, event_id: 6)

Artist.create(
    name: "Laura Glaess",
    description: "Lindy Hop Instructor Based in Texas",
    image_url: "imageplaceholder123456",
    instructor: true
)

ArtistDanceStyle.create(artist_id: 2, dance_style_id: 4)
EventArtist.create(artist_id: 2, event_id: 7)

Artist.create(
    name: "Maykel Fonts",
    description: "Salsa Instructor Based in Cuba",
    image_url: "imageplaceholder123456",
    instructor: true
)

ArtistDanceStyle.create(artist_id: 3, dance_style_id: 1)
EventArtist.create(artist_id: 3, event_id: 1)


Artist.create(
    name: "Jorge Burgos",
    description: "Bachata Instructor Based in Florida",
    image_url: "imageplaceholder123456",
    instructor: true
)

ArtistDanceStyle.create(artist_id: 4, dance_style_id: 2)
EventArtist.create(artist_id: 4, event_id: 3)


Artist.create(
    name: "Gui Prada",
    description: "Brazilian Zouk Instructor Based in DC",
    image_url: "imageplaceholder123456",
    instructor: true
)

ArtistDanceStyle.create(artist_id: 5, dance_style_id: 15)
EventArtist.create(artist_id: 5, event_id: 5)

Artist.create(
    name: "Vanessa Yxcea",
    description: "Fusion Instructor Based in Dallas",
    image_url: "imageplaceholder123456",
    instructor: true
)

ArtistDanceStyle.create(artist_id: 6, dance_style_id: 8)
EventArtist.create(artist_id: 6, event_id: 4)

Artist.create(
    name: "Doug Silton",
    description: "West Coast Swing Instructor Based in Seattle",
    image_url: "imageplaceholder123456",
    instructor: true
)

ArtistDanceStyle.create(artist_id: 7, dance_style_id: 5)
EventArtist.create(artist_id: 7, event_id: 8)

Artist.create(
    name: "Carrie Field",
    description: "Tango Instructor Based in Los Angeles",
    image_url: "imageplaceholder123456",
    instructor: true
)

ArtistDanceStyle.create(artist_id: 8, dance_style_id: 6)
EventArtist.create(artist_id: 8, event_id: 2)