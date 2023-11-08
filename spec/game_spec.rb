require 'rspec'
require 'json'
require 'time'
require_relative '../lib/game/game'

# rubocop:disable Metrics/BlockLength
RSpec.describe Game do
  let(:game) do
    Game.new(
      Time.now,
      item_id: 25,
      multiplayer: true,
      last_played_at: Time.parse('2023-11-08 08:17:55 +0000'),
      title: 'Pool'
    )
  end

  describe '#initialize' do
    it 'sets the publish_date and attributes' do
      expect(game.item_id).to eq(25)
      expect(game.multiplayer).to eq(true)
      expect(game.last_played_at).to eq(Time.parse('2023-11-08 08:17:55 +0000'))
      expect(game.title).to eq('Pool')
    end
  end

  describe '#item_id=' do
    it 'assigns the ID to the game' do
      game.item_id = 42
      expect(game.item_id).to eq(42)
    end
  end

  describe '#to_json' do
    it 'returns a JSON representation of the game' do
      game.item_id = 25
      game.author_id = 1 # Assuming the author_id is available
      json = game.to_json
      expect(json).to eq('{"id":null,"publish_date":null,"archived":null,"item_id":25,"multiplayer":true,"last_played_at":"2023-11-08T08:17:55Z","title":"Pool","author_id":1}')
    end
  end

  describe '.from_json' do
    it 'returns a Game object from a JSON string' do
      json = '{"id":347,"publish_date":"2023-11-08T08:50:35+00:00","archived":false,"item_id":1,"multiplayer":true,"last_played_at":"2023-11-08 08:52:13 +0000","title":"Pool","author_id":1}'
      game = Game.from_json(json)
      expect(game).to be_an_instance_of(Game)
      expect(game.item_id).to eq(1)
      expect(game.publish_date).to eq(Time.parse('2023-11-08T08:50:35+00:00'))
      expect(game.archived).to eq(false)
      expect(game.multiplayer).to eq(true)
      expect(game.last_played_at).to eq(Time.parse('2023-11-08 08:52:13 +0000'))
      expect(game.title).to eq('Pool')
      expect(game.author_id).to eq(1)
    end
  end
end
# rubocop:enable Metrics/BlockLength
