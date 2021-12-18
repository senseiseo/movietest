module MoviesHelper
  def format_average_stars(movie)
    if average_stars(movie).nil?
      content_tag(:span, "None stars")
    else
      pluralize(number_with_precision(average_stars(movie), precision: 1) , 'star')
    end
  end

  def average_stars(movie)
    movie.ratings.average(:stars)
  end
end