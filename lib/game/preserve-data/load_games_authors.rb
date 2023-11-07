# frozen_string_literal: true

def load_games_authors
  data_dir = File.join(File.dirname(__FILE__), 'lib', 'data')
  games_file = File.join(data_dir, 'games.json')
  authors_file = File.join(data_dir, 'authors.json')

  # Load and deserialize games from games.json
  if File.file?(games_file)
    games_data = JSON.parse(File.read(games_file))
    games_data.each do |game|
      @item << Game.new(game['id'], Time.parse(game['publish_date']), game['archived'], game)
    end
  end

  # Load and deserialize authors from authors.json
  return unless File.file?(authors_file)

  authors_data = JSON.parse(File.read(authors_file))
  authors_data.each do |author|
    Author.all << Author.new(author['id'], author['first_name'], author['last_name'])
  end
end
