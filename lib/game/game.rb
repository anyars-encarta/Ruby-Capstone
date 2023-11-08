# frozen_string_literal: true

require_relative '../item'
require_relative './game'

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
    game_data = JSON.parse(json_data)
    game = new(game_data['publish_date'], game_data)
    game.set_author if game.author_id
    game
  end
end
