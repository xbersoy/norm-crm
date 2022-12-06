# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Rails.logger.info 'Creating User....'

user = User.new(
  first_name: 'Burak',
  last_name: 'Ersoy',
  password: '12345678',
  password_confirmation: '12345678',
  email: 'burakersoy@msn.com',
  company_occupation_field: 'Yazılım/Teknoloji',
  company_name:             'Sarif Industries'
)

user.save!

Rails.logger.info 'Creating Company....'

  # id is required for connecting records across different apps
  company = Company.new(
    id:               1,
    name:             user.company_name,
    occupation_field: user.company_occupation_field
  )

  company.owner = user
  company.save!
