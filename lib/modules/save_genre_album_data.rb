require 'json'

module SaveGenreAlbumData
  ALBUMS_FILE = 'lib/data/music_albums.json'.freeze
  GENRES_FILE = 'lib/data/genres.json'.freeze
  DATA_PATH = 'lib/data'.freeze

  def save_genre
    hash = []
    FileUtils.mkdir_p(DATA_PATH) unless File.exist?(GENRES_FILE)
    @genres.each do |genre|
      aux = {
        name: genre.name
      }
      hash << aux
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
