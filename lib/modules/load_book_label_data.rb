module LoadGenreAlbumData
  BOOK_FILE = 'lib/data/book.json'.freeze
  LABEL_FILE = 'lib/data/label.json'.freeze

  def load_label_data
    hash = []
    return hash unless File.exist?(LABEL_FILE)

    file = File.read(LABEL_FILE)
    hash = JSON.parse(file)
    @label = hash.map do |label|
      Label.new(label['title'], label['color'])
    end
  end

  def load_book_data
    hash = []
    return hash unless File.exist?(BOOK_FILE)

    file = File.read(BOOK_FILE)
    hash = JSON.parse(file)
    hash.each do |book|
      label = @label.find { |elem| elem.id == book['label_id'] }
      book = Book.new(book['date'], book['publisher'], book['cover_state'], book['label'])
      book.save_label(label)
      @books << book
    end
  end
end
