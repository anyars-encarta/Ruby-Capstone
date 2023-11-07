require_relative 'app'
require_relative 'menu'

# Represents the app's main entry point.
class Main
  def initialize
    @app = App.new
    @choices = {
      1 => -> { @app.list_all_books },
      2 => -> { @app.list_all_music_albums },
      3 => -> { @app.list_of_games },
      4 => -> { @app.list_all_genres },
      5 => -> { @app.list_all_labels },
      6 => -> { @app.list_all_authors },
      7 => -> { @app.add_a_book },
      8 => -> { @app.add_a_music_album },
      9 => -> { @app.add_a_game },
      10 => -> { quit }
    }
  end

  def main
    loop do
      display_menu
      choice = gets.chomp.to_i
      handle_choice(choice)
    end
  end
end

Main.new.main
