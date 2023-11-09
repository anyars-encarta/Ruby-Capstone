require 'date'

# Represents an item with various attributes such as genre, author, source, and label.
class Item
  attr_accessor :genre, :genre_id, :author, :author_id, :label_id
  attr_reader :id, :publish_date, :archived

  @@items = []

  def initialize(publish_date, archived: false, genre_id: nil, author_id: nil, label_id: nil)
    @id = rand(1..500)
    @publish_date = Date.strptime(publish_date.to_s, '%Y-%m-%d')
    @archived = archived
    @genre_id = genre_id
    @author_id = author_id
    @label_id = label_id

    @@items << self
  end

  def self.all
    @@items
  end

  def save_genre(genre)
    @genre_id = genre.id
  end

  def save_author(author)
    @author = author
    @author_id = author.id
    author.add_item(self)
  end

  def save_label(label)
    @label_id = label.id
  end

  def can_be_archived
    (Time.now.year - @publish_date.year) > 10
  end

  def move_to_archived
    @archived = true if can_be_archived?
  end
end
