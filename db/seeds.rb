# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Customer.create(first_name: 'Hannah',
                last_name: 'Warner',
                email: 'hannah@mail.com',
                address: '123 Main St',
                city: 'New York',
                state: 'NY',
                zip: '11106')

Tea.create( name: 'Sun Moon Lake Hong Cha',
            description: 'Light, naturally sweet and floral oolong tea',
            temperature_fahrenheit: 190,
            brew_time_mins: 4
          )

Tea.create( name: 'Green Monster Matcha',
            description: 'Vegetal and grass-like',
            temperature_fahrenheit: 180,
            brew_time_mins: 3
          )

Tea.create( name: 'Pai Mu Tan White Tea',
            description: 'Light, clean and mildly sweet on the finish',
            temperature_fahrenheit: 190,
            brew_time_mins: 4)
