require 'spec_helper'

describe Book do
  before :each do
    @book = Book.new('2022-05-05', 'publish', 'bad', 12)
  end

  describe '#new' do
    it 'Return a new book object' do
      @book.should be_an_instance_of Book
    end
  end

  describe 'methods' do
    it 'can_be_archived? should return false' do
      @book.can_be_archived.should be false
    end
  end
end
