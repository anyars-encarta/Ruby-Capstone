# Genre class
class Genre
  attr_reader :id
  attr_accessor :name, :items

  def initialization(name)
    @id = rand(1..500)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
  end
end
