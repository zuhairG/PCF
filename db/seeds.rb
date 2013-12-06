# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(name: 'admin', email: 'pcf@andrew.cmu.edu', admin: true, password: 'asdf1234', password_confirmation: 'asdf1234')

User.create(name: 'Brian Gray', email: 'brianmgray@gmail.com', admin: true, password: 'brain@PCF2014', password_confirmation: 'brain@PCF2014')

User.create(name: 'Jerome Fitzgerald', email: 'jeromes@gmail.com', admin: true, password: 'jerome@PCF2014', password_confirmation: 'jerome@PCF2014')

