# frozen_string_literal: true

require_relative 'app'

private

def display_menu
  puts '1. List all books'
  puts '2. List all music albums'
  puts '3. List of games'
  puts '4. List all genres'
  puts '5. List all labels'
  puts '6. List all authors'
  puts '7. Add a book'
  puts '8. Add a music album'
  puts '9. Add a game'
  puts '10. Quit'
end

def handle_choice(choice)
  case choice
  when 1..6 then choice_list(choice)
  when 7, 8, 9 then choice_add(choice)
  when 10 then quit
  else
    invalid_choice
  end
end

def choice_add(choice)
  case choice
  when 7 then @app.add_a_book
  when 8 then @app.add_a_music_album
  when 9 then @app.add_a_game
  end
end

def choice_list(choice)
  case choice
  when 1 then @app.list_all_books
  when 2 then @app.list_all_music_albums
  when 3 then @app.list_of_games
  when 4 then @app.list_all_genres
  when 5 then @app.list_all_labels
  when 6 then @app.list_all_authors
  end
end

def quit
  puts 'Thank you for using our Catalog App. Goodbye!'
  exit
end

def invalid_choice
  puts 'Invalid choice. Please try again.'
end
