#movie list with ratings

# http://www.imdb.com/chart/top
hteml_doc.search("tr").each do |movie| #within the tag 'tr'
  movie_title =  movie.search('.titleColumn > a').text #gets the movie title
  movie_rating = movie.search('.imdbRating > strong').text #gets all the variable
  movie_list << {title: title, rating: rating} #push hash of data with title and rating as key value pair into the array movie_title
end
