require_relative '../item'

# class book
class Book < Item
  attr_accessor :publish_date, :publisher, :cover_state, :label_id, :archived

  def initialize(publish_date, publisher, cover_state, label_id, archived: false)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
    @label_id = label_id
    @archived = archived
  end

  private

  def can_be_archived?
  end
end
