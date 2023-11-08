# class book
class Book < Item
  attr_accessor :title, :author, :genre, :cover_state

  def initialize(published_date, title, author, genre, cover_state)
    super(published_date)
    @title = title
    @author = author
    @genre = genre
    @cover_state = cover_state
  end

  private

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
