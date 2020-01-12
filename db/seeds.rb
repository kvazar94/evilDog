# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.create(email: "admin@gmail.com", password: "qwerty123", admin: true)
# Role.create(name: :admin)
# Role.create(name: :user)

@st_m = %w[draft fresh approved rejected published archived]
User.create([{
              first_name: 'Великий',
              last_name: 'Мастер',
              email: 'admin@gmail.com',
              password: 'qwerty123',
              password_confirmation: 'qwerty123',
              admin: true

            }])

10.times do
  User.create([{
                first_name: Faker::Name.first_name,
                last_name: Faker::Name.last_name,
                email: Faker::Internet.safe_email,
                password: 'qwerty123',
                password_confirmation: 'qwerty123'

              }])
end

15.times do
  Category.create([{
                    # ancestry: Faker::Number.between(from: 1, to: 15),
                    name: Faker::Space.moon
                  }])
end

50.times do
  ads = Advertisement.new(
    title: Faker::Movie.quote,
    body: Faker::ChuckNorris.fact,
    user_id: Faker::Number.between(from: 1, to: 10),
    created_at: Faker::Date.in_date_period(year: 2020, month: 1),
    updated_at: Faker::Date.in_date_period(year: 2020, month: 1),
    category_id: Faker::Number.between(from: 1, to: 15), # random = Random.new(15),
    state: @st_m.sample
  )
  ads.save
end
