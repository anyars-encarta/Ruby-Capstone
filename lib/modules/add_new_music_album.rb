require_relative '../music_album'

# MusicAlbum modules
module AddNewMusicAlbum
  def add_new_music_album(publish_date, on_spotify)
    MusicAlbum.new(publish_date, on_spotify)
  end

  def list_albums
    puts 'Music Albums: '
    if @albums.empty?
      puts 'Nothing to see, add a new Music Album'
    else
      @albums.each_with_index do |album, index|
        puts "#{index}) Name: #{album.publish_date}"
      end
    end
  end
end
