require_relative '../genre'
require_relative '../music_album'

module LoadGenreAlbumData
  ALBUMS_FILE = 'lib/storage/music_albums.json'.freeze
  GENRES_FILE = 'lib/storage/genres.json'.freeze

  def load_genre_data
    hash = []
    return hash unless File.exist?(GENRES_FILE)

    file = File.read(GENRES_FILE)
    hash = JSON.parse(file)
    @genres = hash.map do |genre|
      Genre.new(genre['name'])
    end
  end

  def load_music_album_data
    hash = []
    return hash unless File.exist?(ALBUMS_FILE)

    file = File.read(ALBUMS_FILE)
    hash = JSON.parse(file)
    hash.each do |album|
      genre = @genres.find { |elem| elem.name == album['genre'] }
      album = MusicAlbum.new(album['publish_date'], album['on_spotify'])
      album.save_genre(genre)
      @albums << album
    end
  end
end
