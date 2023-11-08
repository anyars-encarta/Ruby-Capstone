require_relative '../item'

# Represents a Game with various attributes such as item_id, multiplayer, last_played_at.
class Game < Item
  attr_accessor :item_id, :multiplayer, :last_played_at, :title, :author_id

  def initialize(publish_date, attributes = {})
    super(publish_date)
    @item_id = attributes[:item_id]
    @multiplayer = attributes[:multiplayer] || true
    @last_played_at = attributes[:last_played_at] || Time.now
    @title = attributes[:title] || ''
    @author_id = attributes[:author_id]
    # @author = Author.all.find { |a| a.id == @author_id } # Set the author instance variable
    # @author = nil
    set_author if @author_id
  end

  def set_author
    @author = Author.all.find { |a| a.id == @author_id }
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
      author_id: author.nil? ? nil : author.id
    }.to_json
  end

  def self.from_json(json_data)
    game = JSON.parse(json_data)
    game['publish_date'] = DateTime.parse(game['publish_date'])
    # author_id = game['author_id']
    # author = Author.all.find { |a| a.id == author_id }
    # game['author'] = author unless author.nil?
    new(game['publish_date'], game)
  end
end
