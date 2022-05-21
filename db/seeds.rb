# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user_one = User.create(name: "Reddy")
user_two = User.create(name: "Ola")
user_three = User.create(name: "Kalle")


shawama = Recipe.create(
    name: 'Shawarma',
    preparation_time: '5 hours',
    cooking_time: '2 hours',
    description: 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs',
    # public: true,
    user_id: user_one.id
)

jollof = Recipe.create(
    name: 'Jollof Rice',
    preparation_time: '3 hours',
    cooking_time: '1.3 hours',
    description: 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs',
    public: true,
    user_id: user_two.id
)

