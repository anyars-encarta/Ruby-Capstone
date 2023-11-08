<<<<<<< HEAD
=======
require 'date'

>>>>>>> 6ad776b7ff2ea9e8456dff38bcefd0de9b00f921
# Represents an item with various attributes such as genre, author, source, and label.
class Item
  attr_accessor :genre, :author, :source, :label
  attr_reader :id, :publish_date, :archived

  @items = []

  def initialize(publish_date, archived: false)
    @id = rand(1..500)
    @publish_date = Date.strptime(publish_date, '%Y-%m-%d')
    @archived = archived
  end

  def self.all
    @items
  end

  def save_genre(genre)
    @genre = genre
  end

  def save_author(author)
    @author = author
    @author_id = author.id
    author.add_item(self)
  end

  def save_label(label)
    @label = label
  end

  def can_be_archived
    (Time.now.year - @publish_date.year) > 10
  end

  def move_to_archived
    @archived = true if can_be_archived?
  end
end
