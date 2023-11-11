# class book
class Book < Item
  attr_accessor :publisher, :cover_state, :item_id

  def initialize(publish_date, publisher, cover_state, label_id)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
    @label_id = label_id
  end

  private

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
