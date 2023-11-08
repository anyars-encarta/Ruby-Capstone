# game_spec.rb
require_relative '../lib/game/game' # Update the path as needed
require_relative '../lib/game/author' # You'll need to create an Author class or use an existing one
require 'json'
require 'date'

# rubocop:disable Metrics/BlockLength
RSpec.describe Game do
  let(:author) { Author.new(1, 'John', 'Doe') } # Create an Author instance for testing
  let(:game_attributes) do
    {
      item_id: 1,
      publish_date: Date.new(2020, 1, 1),
      author_id: author.id
    }
  end

  subject(:game) { described_class.new(game_attributes[:publish_date], game_attributes) }

  describe '#initialize' do
    it 'sets default values' do
      current_time = DateTime.now
      expect(game.multiplayer).to be true
      expect(game.last_played_at.to_date).to eq(current_time.to_date)
      expect(game.title).to eq('')
    end

    # it 'sets author when author_id is provided' do
    #   game_attributes[:author_id] = author.id
    #   game = Game.new(game_attributes[:publish_date], game_attributes)
    #   expect(game.author).to eq(author)
    # end

    it 'does not set author when author_id is not provided' do
      game_attributes[:author_id] = nil
      game = Game.new(game_attributes[:publish_date], game_attributes)
      expect(game.author).to be_nil
    end
  end

  describe '.from_json' do
    it 'parses JSON data and returns a Game object' do
      game_attributes[:author_id] = author.id # Make sure author_id is set
      json_data = game.to_json
      parsed_game = Game.from_json(json_data)
      expect(parsed_game).to be_an_instance_of(Game)
    end

    # it 'correctly sets the author object when author_id is provided' do
    #   game_attributes[:author_id] = author.id # Make sure author_id is set
    #   json_data = game.to_json
    #   parsed_game = Game.from_json(json_data)
    #   expect(parsed_game.author.id).to eq(author.id)
    # end
  end
end
# rubocop:enable Metrics/BlockLength
