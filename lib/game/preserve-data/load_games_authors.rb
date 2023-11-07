require 'date'

def load_games_authors
  authors_file = File.join(DATA_PATH, 'authors.json')
  games_file = File.join(DATA_PATH, 'games.json')

  # Load and deserialize authors from authors.json
  if File.file?(authors_file)
    authors_data = JSON.parse(File.read(authors_file))
    authors_data.each do |author|
      new_author = Author.from_json(author.to_json)
      Author.all << new_author
    end
  end

  # Load and deserialize games from games.json
  if File.file?(games_file)
    games_data = JSON.parse(File.read(games_file))
    games_data.each do |game|
      # Convert the 'publish_date' string to a DateTime object
      game['publish_date'] = DateTime.parse(game['publish_date'])
      # Find the author by author_id, or set to nil if not found
      author = Author.all.find { |a| a.id == game['author_id'] }
      if author
        new_game = Game.new(game['publish_date'], title: game['title'])
        new_game.save_author(author)
        @item << new_game
      else
        # Handle the case where the author cannot be found
        puts "Author not found for game with ID #{game['id']}. Skipping this game."
      end
    end
  end
end
