require 'json'

# Module to preserve data
module SaveBookLabelData
  BOOK_FILE = 'lib/data/book.json'.freeze
  LABEL_FILE = 'lib/data/label.json'.freeze
  DATA_PATH = 'lib/data'.freeze

  def save_label
    hash = []
    FileUtils.mkdir_p(DATA_PATH) unless File.exist?(LABEL_FILE)
    @label.each do |label|
      aux = {
        title: label.title,
        color: label.color
      }
      hash << aux
    end
    File.write(LABEL_FILE, JSON.pretty_generate(hash))
  end

  def save_book
    hash = []
    @books.each do |book|
      aux = {
        date: book.publish_date,
        publiser: book.publisher,
        cover_state: book.cover_state,
        label: book.label_id
      }
      hash << aux
    end
    File.write(BOOK_FILE, JSON.pretty_generate(hash))
  end
end
