def save_games_authors
  data_dir = File.join(File.dirname(__FILE__), 'lib', 'data')
  Dir.mkdir(data_dir) unless File.directory?(data_dir)

  games_file = File.join(data_dir, 'games.json')
  authors_file = File.join(data_dir, 'authors.json')

  # Serialize and save games to games.json
  File.open(games_file, 'w') do |file|
    file.puts JSON.generate(@item.select { |item| item.is_a?(Game) })
  end

  # Serialize and save authors to authors.json
  File.open(authors_file, 'w') do |file|
    file.puts JSON.generate(Author.all)
  end
end
