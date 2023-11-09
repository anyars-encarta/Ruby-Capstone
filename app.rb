require 'json'
require './lib/item'
require './lib/game/game'
require './lib/game/author'
require './lib/game/preserve-data/load_games_authors'
require './lib/game/preserve-data/save_games_authors'
require './lib/modules/add_new_music_album'
require './lib/modules/list_genres'
require './lib/modules/save_genre_album_data'
require './lib/modules/load_genre_album_data'
require './lib/book/book'
require './lib/book/label'
require './lib/modules/add_book'
require './lib/modules/save_book_label_data'


# Represents an app with various attributes such as item.
class App
  include AddNewMusicAlbum
  include ListGenres
  include SaveGenreAlbumData
  include LoadGenreAlbumData
  include NEWBOOK
  include SaveBookLabelData
  attr_accessor :item

  include SaveGamesAuthorsData

  def initialize
    @genres = []
    @albums = []
    @item = []
    @label = []
    @author = []
    @books = []
    load_data
    load_genre_data
    load_music_album_data
  end

  def load_data
    load_games_authors
  end

  def save_data
    save_games_authors
  end

  def list_all_music_albums
    list_albums
  end

  def list_of_games
    puts 'List of all games:'

    if @item.empty?
      puts 'No games added'
    else
      @item.each do |item|
        puts "Title: #{item.title}, Author: #{item.author.full_name}" if item.is_a?(Game)
      end
    end
  end

  def list_all_genres
    puts 'Genres: '
    list_genres
  end

  def list_all_books
    list_books
  end

  def list_all_labels
    list_labels
  end

  def list_all_authors
    puts 'List of all authors:'
    Author.all.each do |author|
      puts "Author ID: #{author.id}, Full Name: #{author.full_name}"
    end
  end

  def add_a_music_album
    puts 'Create Music Album:'
    puts 'The Album is in Spotify? (y/n)'
    on_spotify = gets.chomp
    on_spotify = case on_spotify
                 when 'y' then true
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
    save_genre
    save_music_album
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

  def add_a_book
    puts 'Enter the book\'s publish date (YYYY-MM-DD):'
    date = gets.chomp
    puts 'Enter the book\'s publisher:'
    publisher = gets.chomp
    puts "Select label:\n1. Gift\n2. New\n"
    label_choice = gets.chomp.to_i
    puts 'Enter the book\'s label color:'
    label_color = gets.chomp
    print "Select cover state: \n1. Good \n2. Bad\n"
    cover_state_choice = gets.chomp.to_i
    add_new_book(date, publisher, cover_state_choice, label_choice, label_color)
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
    genre_choice = gets.to_i
    if @genres.length == genre_choice
      puts 'Write the name of the new genre:'
      new_genre_name = gets.chomp
      @new_genre = add_new_genre(new_genre_name)
      @new_genre.add_item(@album)
      @genres << @new_genre
      @album.save_genre(@new_genre)
      puts 'Genre created successfully'
    else
      @album.genre = @genres[genre_choice]
      @album.save_genre(@genres[genre_choice])
    end
  end
end
