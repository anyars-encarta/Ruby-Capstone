# frozen_string_literal: true

# Represents an Author class with various attributes such as id, first_name, last_name.
class Author
  attr_accessor :first_name, :last_name
  attr_reader :id, :items

  def initialize(id, first_name, last_name)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def full_name
    "#{@first_name} #{@last_name}"
  end

  def add_item(item)
    item.author = self
    @items << item
  end
end
