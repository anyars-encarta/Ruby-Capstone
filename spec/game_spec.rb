require_relative '../lib/game/game'
require_relative '../lib/game/author'
require 'json'
require 'date'

# rubocop:disable Metrics/BlockLength
RSpec.describe Game do
  let(:author) { Author.new(1, 'John', 'Doe') }
  let(:game_attributes) do
    {
      item_id: 1,
      publish_date: Date.new(2020, 1, 1),
      author_id: author.id,
      title: 'Sample Game Title'
    }
  end
  subject(:game) { described_class.new(game_attributes[:publish_date], game_attributes) }

  describe '#initialize' do
    it 'sets default values' do
      current_time = DateTime.now
      expect(game.multiplayer).to be true
      expect(game.last_played_at.to_date).to eq(current_time.to_date)
      expect(game.title).to eq('Sample Game Title')
    end

    it 'correctly sets title' do
      game_attributes[:title] = game.title
      game = Game.new(game_attributes[:title], game_attributes)

      expect(game.title).to eq('Sample Game Title')
    end

    it 'does not set author when author_id is not provided' do
      game_attributes[:author_id] = nil
      game = Game.new(game_attributes[:publish_date], game_attributes)
      expect(game.author).to be_nil
    end
  end

  describe '.from_json' do
    it 'parses JSON data and returns a Game object' do
      game_attributes[:author_id] = author.id
      json_data = game.to_json
      parsed_game = Game.from_json(json_data)
      expect(parsed_game).to be_an_instance_of(Game)
    end
  end

  describe '.to_json' do
    it 'correctly serializes to JSON' do
      json_data = game.to_json
      expected_json = {
        id: game.id,
        publish_date: game.publish_date,
        archived: game.archived,
        item_id: game.item_id,
        multiplayer: game.multiplayer,
        last_played_at: game.last_played_at,
        title: game.title,
        author_id: game.author.nil? ? nil : game.author.id
      }.to_json
      expect(json_data).to eq(expected_json)
    end
  end
end
# rubocop:enable Metrics/BlockLength
