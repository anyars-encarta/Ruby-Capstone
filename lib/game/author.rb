# Represents an Author class with various attributes such as id, first_name, last_name.
class Author
  attr_accessor :id, :first_name, :last_name, :items

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

  def self.all
    @all ||= []
  end

  def to_json(*_args)
    {
      id: @id,
      first_name: @first_name,
      last_name: @last_name,
      items: @items
    }.to_json
  end

  # def self.from_json(json_data)
  #   author_data = JSON.parse(json_data)
  #   author = new(author_data['id'], author_data['first_name'], author_data['last_name'])
  #   author_data['items'].each do |item_id|
  #     item = Item.all.find { |i| i.id == item_id }
  #     author.add_item(item) if item
  #   end
  #   author
  # end

  def self.from_json(json_data)
    author = JSON.parse(json_data)
    new(author['id'], author['first_name'], author['last_name'])
  end
end
