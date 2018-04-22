# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Level.create(name:"beginner")
Level.create(name:"intermediate")
Level.create(name:"advanced")
Category.create(name:"standing")
Category.create(name:"seated")
Category.create(name:"lying down")
