require 'spec_helper'

describe Genre do
  before :each do
    @genre = Genre.new('Pop')
  end

  describe '#new' do
    it 'new genre' do
      @genre.should be_an_instance_of Genre
    end

    it 'add_item' do
      @album = MusicAlbum.new('2022-05-05', true)
      @genre.add_item(@album)
      @genre.items.length.should eql 1
    end
  end
end
