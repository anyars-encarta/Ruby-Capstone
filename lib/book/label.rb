# class label
class Label
  attr_accessor :title, :color, :book_id
  attr_reader :id, :items

  def initialize(options = {})
    @id = options.key?(:id) ? options[:id] : Random.rand(1..1000)
    @title = options.key?(:title) ? options[:title] : nil
    @color = options.key?(:color) ? options[:color] : nil
    @book_id = options.key?(:book_id) ? options[:book_id] : nil
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
    item.save_label(self)
  end
end
