require 'date'

def load_games_authors
  games_file = File.join(DATA_PATH, 'games.json')
  authors_file = File.join(DATA_PATH, 'authors.json')

  # Load and deserialize games from games.json
  if File.file?(games_file)
    games_data = JSON.parse(File.read(games_file))  # Corrected 'File.read' here
    games_data.each do |game|
      # Convert the 'publish_date' string to a DateTime object
      game['publish_date'] = DateTime.parse(game['publish_date'])
      author = Author.all.find { |a| a.id == game['author_id'] }
      @item << Game.new(game['publish_date'], title: game['title'], author: author)
    end
  end

  # Load and deserialize authors from authors.json
  return unless File.file?(authors_file)

  authors_data = JSON.parse(File.read(authors_file))  # Corrected 'File.read' here
  authors_data.each do |author|
    Author.all << Author.new(author['id'], author['first_name'], author['last_name'])
  end
end
