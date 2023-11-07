# Represents an item with various attributes such as genre, author, source, and label.
class Item
  attr_accessor :gener, :author, :source, :label
  attr_reader :id, :publish_date, :archived

  def initialize(publish_date, archived: false)
    @id = rand(1..500)
    @publish_date = publish_date
    @archived = archived
  end

  def save_genre(genre)
    @genre = genre
  end

  def save_author(author)
    @author = author
  end

  def save_source(source)
    @source = source
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
