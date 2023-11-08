# frozen_string_literal: true

# MusicAlbum modules
module AddNewMusicAlbum
  def new_music_album(publish_date, on_spotify)
    MusicAlbum.new(publish_date, on_spotify)
  end
end
