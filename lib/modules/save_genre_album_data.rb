require 'json'

module SaveGenreAlbumData
  ALBUMS_FILE = 'lib/storage/music_albums.json'.freeze
  GENRES_FILE = 'lib/storage/genres.json'.freeze

  def save_genre
    hash = @genres.map do |genre|
      {
        name: genre.name
      }
    end
    File.write(GENRES_FILE, JSON.pretty_generate(hash))
  end

  def save_music_album
    hash = []

    @albums.each do |album|
      aux = {
        publish_date: album.publish_date,
        on_spotify: album.on_spotify,
        genre: album.genre.name
      }
      hash << aux
    end
    File.write(ALBUMS_FILE, JSON.pretty_generate(hash))
  end
end
