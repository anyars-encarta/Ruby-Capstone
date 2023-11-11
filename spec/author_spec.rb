require 'rspec'
require 'json'
require_relative '../lib/game/author'

RSpec.describe Author do
  let(:author) { Author.new(25, 'John', 'Doe') }

  describe '#initialize' do
    it 'sets the id, first_name, last_name, and items' do
      expect(author.id).to eq(25)
      expect(author.first_name).to eq('John')
      expect(author.last_name).to eq('Doe')
      expect(author.items).to eq([])
    end
  end

  describe '#id=' do
    it 'assigns the ID to the author' do
      author.id = 123
      expect(author.id).to eq(123)
    end
  end

  describe '#items=' do
    it 'assigns the Items ID to the author' do
      author.items = [132]
      expect(author.items).to eq([132])
    end
  end

  describe '#to_json' do
    it 'returns a JSON representation of the author' do
      author.items = [132]
      json = author.to_json
      expect(json).to eq('{"id":25,"first_name":"John","last_name":"Doe","items":[132]}')
    end
  end

  describe '.from_json' do
    it 'returns an Author object from a JSON string' do
      json = '{"id":123,"first_name":"John","last_name":"Doe","items":[132]}'
      author = Author.from_json(json)
      expect(author).to be_an_instance_of(Author)
      expect(author.id).to eq(123)
      expect(author.first_name).to eq('John')
      expect(author.last_name).to eq('Doe')
      expect(author.items).to eq([])
    end
  end
end
