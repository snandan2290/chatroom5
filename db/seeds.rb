# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(username: "Vnandan", password: "Vnanda")
User.create(username: "Divya", password: "Divya")

# user = User.order_by(:id).limit(1).offset(1) # Considering tere one alreayd inserted in Rails console
user = User.second
Message.create(message_body: "Hey guys", user: user)

user = User.third
Message.create(message_body: "Hey guys", user: user)