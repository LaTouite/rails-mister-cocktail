# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

def read_api
  url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
  attempt_serialized = open(url).read
  ingredient = JSON.parse(attempt_serialized)
  ingredient['drinks'].each do |drink|
    Ingredient.create(name: drink['strIngredient1'])
  end
end
