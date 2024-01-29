require "json"
require "open-uri"

puts "Cleaning database..."
Movie.destroy_all
puts "Creating movies..."

url = "http://tmdb.lewagon.com/movie/top_rated?language=en-US&page=1"
user_serialized = URI.open(url).read
movie_data = JSON.parse(user_serialized)

movie_data['results'].each do |movie|
  attributes = { title: movie['title'], overview: movie['overview'], poster_url: movie['poster_path'], rating: movie['vote_average'] }
  Movie.create!(attributes)
end

puts "Finished!"

