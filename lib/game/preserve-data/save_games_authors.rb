# frozen_string_literal: true

require 'fileutils'
require 'json'

DATA_PATH = 'lib/data'
FileUtils.mkdir_p(DATA_PATH)

def save_games_authors
  games_file = File.join(DATA_PATH, 'games.json')
  authors_file = File.join(DATA_PATH, 'authors.json')

  # Save games to games.json
  File.open(games_file, 'w') do |file|
    file.puts JSON.generate(@item.select { |item| item.is_a?(Game) })
  end

  # Save authors to authors.json
  File.open(authors_file, 'w') do |file|
    file.puts JSON.generate(Author.all)
  end
end
