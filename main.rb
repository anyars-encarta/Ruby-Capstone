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
      puts '
            █▀▀ █▀█ ▀█▀ █▀█ █░░ █▀█ █▀▀   █▀█ █▀█ █▀█
            █▄▄ █▀█ ░█░ █▀█ █▄▄ █▄█ █▄█   █▀█ █▀▀ █▀▀'
      puts ''
      puts 'ᴘʟᴇᴀsᴇ sᴇʟᴇcᴛ ᴀɴ ᴏᴘᴛɪᴏɴ:'

      display_menu
      choice = gets.chomp.to_i
      handle_choice(choice)
      puts '=================================='
    end
  end
end

Main.new.main
