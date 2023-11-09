require_relative '../book/book'

#New Book
module NEWBOOK
  def add_new_book(date, publisher, cover, l_title,l_color)
    label = Label.new(l_title, l_color)
    @label << label
    book = Book.new(date, publisher, cover, label.id)
    @books << book
    puts 'Book added successfully!'
  end
end