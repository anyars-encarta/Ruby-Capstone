require 'json'
require './lib/item'
require './lib/game/game'
require './lib/game/author'
require './lib/game/preserve-data/load_games_authors'
require './lib/game/preserve-data/save_games_authors'
require './lib/modules/add_new_music_album'
require './lib/modules/list_genres'
# Represents an app with various attributes such as item.
class App
  include AddNewMusicAlbum
  include ListGenres
  attr_accessor :item

  def initialize
    @genres = []
    @albums = []
    @item = []
    load_data
  end

  def load_data
    load_games_authors
  end

  def save_data
    save_games_authors
  end

  def list_all_books
    puts 'List of all books:'
  end

  def list_all_music_albums
    list_albums
  end

  def list_of_games
    puts 'List of all games:'
    @item.each do |item|
      puts "Title: #{item.title}, Author: #{item.author.full_name}" if item.is_a?(Game)
    end
  end

  def list_all_genres
    puts 'Genres: '
    list_genres
  end

  def list_all_labels
    puts 'List of all labels:'
  end

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
    puts 'Create Music Album:'
    puts 'The Album is in Spotify? (y/n)'
    on_spotify = gets.chomp
    on_spotify = if (on_spotify == 'y') || (on_spotify == 'Y')
                   true
                 else
                   false
                 end
    puts 'Enter the publish date:(yyyy-mm-dd)'
    publish_date = gets.chomp
    @album = add_new_music_album(publish_date, on_spotify)
    puts 'Choose a genre:'
    list_genres
    puts "#{@genres.length}) Add new Genre"
    music_album_save_genre
    @albums << @album
    puts 'Album created successfully'
  end

  def add_a_game
    game_title, first_name, last_name = prompt_for_game_info
    game_author = create_game_author(first_name, last_name)

    Author.all << game_author

    game = create_game(game_title, game_author)
    game_author.add_item(game)

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
      Time.now,
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

  def music_album_save_genre
    genre = gets.to_i
    if @genres.length == genre
      puts 'Write the name of the new genre:'
      new_genre_name = gets.chomp
      @new_genre = add_new_genre(new_genre_name)
      @new_genre.add_item(@album)
      @genres << @new_genre
      @album.save_genre(@new_genre)
      puts 'Genre created successfully'
    else
      @album.save_genre(@genres[genre])
    end
  end
end
