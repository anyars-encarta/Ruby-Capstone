require 'spec_helper'

describe MusicAlbum do
  before :each do
    @album = MusicAlbum.new('2022-05-05', true)
  end

  describe '#new' do
    it 'Return a new album object' do
      @album.should be_an_instance_of MusicAlbum
    end
  end

  describe 'methods' do
    it 'can_be_archived? should return false' do
      @album.can_be_archived.should be false
    end

    it 'can_be_archived? should return true' do
      album2 = MusicAlbum.new('2002-05-05', true)
      album2.can_be_archived.should be true
    end
  end
end
