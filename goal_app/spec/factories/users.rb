    FactoryBot.define do
      factory :user do
        username { Faker::StarWars.character }
        password { "starwars" }
        location factory: :location
      end
    end