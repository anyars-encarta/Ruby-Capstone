# frozen_string_literal: true

require 'date'

def load_games_authors
  load_authors
  load_games
end

def load_authors
  authors_file = File.join(DATA_PATH, 'authors.json')
  return unless File.file?(authors_file)

  authors_data = JSON.parse(File.read(authors_file))
  authors_data.each do |author|
    new_author = Author.from_json(author.to_json)
    Author.all << new_author
  end
end

def load_games
  games_file = File.join(DATA_PATH, 'games.json')
  return unless File.file?(games_file)

  games_data = JSON.parse(File.read(games_file))
  games_data.each do |game|
    load_game(game)
  end
end

def load_game(game)
  game['publish_date'] = DateTime.parse(game['publish_date'])
  author = Author.all.find { |a| a.id == game['author_id'] }
  if author
    new_game = Game.new(game['publish_date'], title: game['title'])
    new_game.save_author(author)
    @item << new_game
  else
    puts "Author not found for game with ID #{game['id']}. Skipping this game."
  end
end
