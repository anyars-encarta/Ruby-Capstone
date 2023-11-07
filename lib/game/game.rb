require_relative '../item'

# Represents a Game with various attributes such as item_id, multiplayer, last_played_at.
class Game < Item
  attr_accessor :item_id, :multiplayer, :last_played_at, :title

  def initialize(publish_date, attributes = {})
    super(publish_date)
    @item_id = attributes[:item_id]
    @multiplayer = attributes[:multiplayer] || true
    @last_played_at = attributes[:last_played_at] || Time.now
    @title = attributes[:title] || ''
  end

  def can_be_archived?
    super && (Time.now.year - @last_played_at.year) > 2
  end

  def to_json(*_args)
    {
      id: @id,
      publish_date: @publish_date,
      archived: @archived,
      item_id: @item_id,
      multiplayer: @multiplayer,
      last_played_at: @last_played_at,
      title: @title,
      author_id: @author.id
    }.to_json
  end

  def self.from_json(json_data)
    game = JSON.parse(json_data)
    # Convert the 'publish_date' string to a Time object
    game['publish_date'] = Time.parse(game['publish_date'])
    author = Author.all.find { |a| a.id == game['author_id'] }
    new(game['id'], game['publish_date'], game['archived'], game.merge(author: author))
  end
end
