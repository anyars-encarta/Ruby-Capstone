# class book
class Book < Item
  attr_accessor :publish_date, :title, :publisher, :genre, :cover_state

  def initialize(publish_date, title, publisher, genre, cover_state)
    super(publish_date)
    @title = title
    @publisher = publisher
    @genre = genre
    @cover_state = cover_state
  end

  private

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
