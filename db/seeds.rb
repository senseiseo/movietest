# 10.times do 
#   name = Faker::Name.first_name  
#   Category.create(name: name)
# end

30.times do 
  title = Faker::Movie.title
  body =  Faker::Movies::VForVendetta.speech
  stars = rand(1..10)
  movie = Movie.create title: title, body: body, stars: stars
  
  rand(1..4).times do
    Position.create(movie_id: movie.id, category_id: rand(1..9))
  end
end 
