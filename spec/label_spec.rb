require 'spec_helper'

describe Label do
  before :each do
    @label = Label.new('title1', 'blue')
  end

  describe '#new' do
    it 'Return a new book object' do
      @label.should be_an_instance_of Label
    end

    it 'add_item' do
      @book = Book.new('2022-05-05', 'publish', 'bad', 12)
      @label.add_item(@book)
      @label.items.length.should eql 1
    end
  end
end
