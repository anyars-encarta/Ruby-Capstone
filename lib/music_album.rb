require_relative 'item'

# MusicAlbum class
class MusicAlbum < Item
  def initialization(publish_date, on_spotify)
    super(publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived; end
end
