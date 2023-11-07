require_relative '../item'

# Represents a Game with various attributes such as item_id, multiplayer, last_played_at.
class Game < Item
  attr_accessor :item_id, :multiplayer, :last_played_at, :title

  def initialize(id, publish_date, archived, attributes = {})
    super(id, publish_date, archived)
    @item_id = attributes[:item_id]
    @multiplayer = attributes[:multiplayer]
    @last_played_at = attributes[:last_played_at]
    @title = attributes[:title]
  end

  def can_be_archived?
    super && (Time.now.year - @last_played_at.year) > 2
  end
end
