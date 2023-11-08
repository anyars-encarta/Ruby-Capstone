require_relative 'app'
require_relative 'menu'

# Represents the app's main entry point.
class Main
  def initialize
    @app = App.new
  end

  def main
    loop do
      puts ' '
      puts 'Welcome to our Catalog App!'
      puts '=================================='
      puts 'Please select an option:'

      display_menu
      choice = gets.chomp.to_i
      handle_choice(choice)
      puts '=================================='
    end
  end
end

Main.new.main
