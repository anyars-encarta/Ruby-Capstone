require 'fileutils'
require 'json'

DATA_PATH = 'lib/data'.freeze
FileUtils.mkdir_p(DATA_PATH)

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
  games_file = File.join(DATA_PATH, 'games.json')
  File.open(games_file, 'w') do |file|
    file.puts JSON.generate(games)
  end
end

def save_authors_to_file(authors)
  authors_file = File.join(DATA_PATH, 'authors.json')
  File.open(authors_file, 'w') do |file|
    file.puts JSON.generate(authors)
  end
end
