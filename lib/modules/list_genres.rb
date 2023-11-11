require_relative '../genre'

# Genres modules
module ListGenres
  def list_genres
    if @genres.empty?
      puts 'No genre registered'
    else
      @genres.each_with_index do |genre, index|
        puts "#{index}) Name: #{genre.name}"
      end
    end
  end

  def add_new_genre(name)
    Genre.new(name)
  end
end
