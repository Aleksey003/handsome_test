# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

    description = "Hotel Cellai is located in the heart of the historic center of Florence in an extremely characteristic, quite and lively area within short walk distance to all sites and is surrounded by the extraordinary beauty of churches, buildings, shops and monuments. Cellai Hotel is part of a lovingly restored 1800 palace"
    100.times {|i|
      Hotel.create(title:"hotel #{i}", room_description: description)
    }
