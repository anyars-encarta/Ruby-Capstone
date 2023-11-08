# frozen_string_literal: true

# Genres modules
module ListGenres
  def list_genres
    puts 'Genres: '
    if @genres.length.zero.zero?
      puts 'Nothing to see'
    else
      @genres.each_with_index do |genre, index|
        puts "#{index}) Name: #{genre.name}"
      end
    end
    puts '-_-_-_-_-_-_-_-_-_-_- '
  end

  def add_new_genre(name)
    Genre.new(name)
  end
end
