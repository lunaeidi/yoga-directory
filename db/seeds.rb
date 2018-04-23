# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Level.create(level:"beginner")
Level.create(level:"intermediate")
Level.create(level:"advanced")

Category.create(name:"standing")
Category.create(name:"seated")
Category.create(name:"arm and leg support")
Category.create(name:"arm balance and inversion")
Category.create(name:"supine")
Category.create(name:"prone")
Category.create(name:"twist")
Category.create(name:"balancing")
Category.create(name:"foreward bend")
Category.create(name:"backbend")
Category.create(name:"lateral bend")
