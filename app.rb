require './lib/item'

# Represents an app with various attributes such as item.
class App
  attr_accessor :item

  def initialize
    @item = []
  end

  def list_all_books
    puts 'List of all books:'
  end

  def list_all_music_albums
    puts 'List of all music albums:'
  end

  def list_of_games
    puts 'List of all games:'
  end

  def list_all_genres
    puts 'List of all genres:'
  end

  def list_all_labels
    puts 'List of all labels:'
  end

  def list_all_authors
    puts 'List of all authors:'
  end

  def add_a_book
    puts 'Enter the book\'s title:'
    title = gets.chomp

    puts 'Enter the book\'s author:'
    author = gets.chomp

    puts "Book created with title: #{title}, author: #{author}"
  end

  def add_a_music_album
    puts 'Enter the album\'s title:'
    album_title = gets.chomp

    puts 'Enter the album\'s artiste:'
    artiste = gets.chomp

    puts "Music album created with title: #{album_title}, artiste: #{artiste}"
  end

  def add_a_game
    puts 'Enter the games\'s title:'
    game_title = gets.chomp

    puts 'Enter the game\'s author:'
    game_author = gets.chomp

    puts "Game created with title: #{game_title}, author: #{game_author}"
  end
end
