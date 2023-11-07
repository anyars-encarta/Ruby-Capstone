# frozen_string_literal: true

require_relative 'app'

private

def display_menu
  puts 'Welcome to our Catalog App!'
  puts 'Please select an option:'
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
  if @choices.key?(choice)
    @choices[choice].call
  else
    invalid_choice
  end
end

def quit
  puts 'Thank you for using our Catalog App. Goodbye!'
  exit
end

def invalid_choice
  puts 'Invalid choice. Please try again.'
end
