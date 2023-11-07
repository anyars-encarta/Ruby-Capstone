require_relative './lib/item'
require_relative './lib/game/game'
require_relative './lib/game/author'
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

  # Implemented List Games
  def list_of_games
    puts 'List of all games:'
    @item.each do |item|
      puts "Title: #{item.title}, Author: #{item.author.full_name}" if item.is_a?(Game)
    end
  end

  def list_all_genres
    puts 'List of all genres:'
  end

  def list_all_labels
    puts 'List of all labels:'
  end

  # Implemented List Authors
  def list_all_authors
    puts 'List of all authors:'
    Author.all.each do |author|
      puts "Author ID: #{author.id}, Full Name: #{author.full_name}"
    end
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

  # Implemented Add Game
  def add_a_game
    game_title, first_name, last_name = prompt_for_game_info
    game_author = create_game_author(first_name, last_name)

    Author.all << game_author

    game = create_game(game_title, game_author)

    add_game_to_collection(game)
    game_author.add_item(game)
    puts "Game created with title: #{game_title}, author: #{first_name} #{last_name}"
  end

  private

  def prompt_for_game_info
    puts 'Enter the game\'s title:'
    game_title = gets.chomp

    puts 'Enter the game\'s author first name:'
    first_name = gets.chomp

    puts 'Enter the game\'s author last name:'
    last_name = gets.chomp

    [game_title, first_name, last_name]
  end

  def create_game_author(first_name, last_name)
    Author.new(@item.length + 1, first_name, last_name)
  end

  def create_game(game_title, game_author)
    Game.new(
      @item.length + 1,
      Time.now,
      false,
      item_id: @item.length + 1,
      multiplayer: true,
      last_played_at: Time.now,
      title: game_title,
      author: game_author
    )
  end

  def add_game_to_collection(game)
    @item << game
  end
end
