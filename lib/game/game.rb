# frozen_string_literal: true

# Represents a Game with various attributes such as item_id, multiplayer, last_played_at.
class Game
  attr_accessor :multiplayer, :last_played_at
  attr_reader :item_id

  def initialize(item_id, multiplayer, last_played_at)
    @item_id = item_id
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def update_last_played_at(date)
    @last_played_at = date
  end
end
