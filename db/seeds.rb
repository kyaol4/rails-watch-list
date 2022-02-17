# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

Movie.destroy_all
# List.destroy_all

# the Le Wagon copy of the API
url = 'http://tmdb.lewagon.com/movie/top_rated'
response = JSON.parse(URI.open(url).read)

response['results'].each do |movie_hash|
  # puts
  # p movie_hash
  # create an instance with the hash
  Movie.create!(
    poster_url: "https://image.tmdb.org/t/p/w500" + movie_hash['poster_path'],
    title: movie_hash['title'],
    overview: movie_hash['overview'],
    rating: movie_hash['vote_average'].round(1)
  )
end

puts 'Made all movies'


puts 'Destroy every lists'
List.destroy_all

puts 'Creating lists'
List.create!(name: 'comedy')
List.create!(name: 'fantasy')
List.create!(name: 'romantic')
List.create!(name: 'asdf')
List.create!(name: 'sdf')
List.create!(name: 'xcv')
List.create!(name: 'ghj')

puts 'Made 7 movie lists'
