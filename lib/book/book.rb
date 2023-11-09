# class book
class Book < Item
  attr_accessor :publisher, :cover_state, :item_id

  def initialize(publish_date:, publisher:, cover_state:, label_id:, item_id:, archived: false, genre_id: nil, author_id: nil)
    super(publish_date: publish_date, archived: archived, genre_id: genre_id, author_id: author_id, label_id: label_id)
    @publisher = publisher
    @cover_state = cover_state
    @item_id = item_id
  end

  private

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
