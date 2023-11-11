require 'fileutils'
require 'json'

DATA_PATH = 'lib/data'.freeze
FileUtils.mkdir_p(DATA_PATH)

# module to save games and authors
module SaveGamesAuthorsData
  GAMES_FILE = 'lib/data/games.json'.freeze
  AUTHORS_FILE = 'lib/data/authors.json'.freeze

  def save_games_authors
    games_with_item_id = assign_item_ids_to_games
    save_games_to_file(games_with_item_id)
    save_authors_to_file(Author.all)
  end

  def assign_item_ids_to_games
    @item.select { |item| item.is_a?(Game) }.map.with_index do |game, index|
      game.item_id = index + 1
      game
    end
  end

  def save_games_to_file(games)
    FileUtils.mkdir_p(DATA_PATH) unless File.exist?(GAMES_FILE)
    File.write(GAMES_FILE, JSON.pretty_generate(games))
  end

  def save_authors_to_file(authors)
    FileUtils.mkdir_p(DATA_PATH) unless File.exist?(AUTHORS_FILE)
    File.write(AUTHORS_FILE, JSON.pretty_generate(authors))
  end
end
