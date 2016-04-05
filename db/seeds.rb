# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Api.create!(paid: false, name: "Weather API for Noobs", url: "www.wunderground.com/something123456789", description: "This is a sweet weather API that shows people the weather.")
Api.create!(paid: true, name: "MBTA in MA", url: "www.mbtanicenice.com/indoooowww/osaoosossa/o222224", description: "This is an awesome MBTA times API. IT WILL CHANGE YOUR WORLD.")
