require_relative '../book/book'

# New Book
module NEWBOOK
  def add_new_book(date, publisher, cover, l_choice, l_color)
    l_title = l_choice == 1 ? 'Gift' : 'New'
    cover_state = cover == 1 ? 'Good' : 'Bad'
    label = Label.new(l_title, l_color)
    @label << label
    book = Book.new(date, publisher, cover_state, label.id)
    @books << book
    puts 'Book added successfully!'
  end

  def list_labels
    puts 'List of all labels:'
    if @label.empty?
      puts 'No labels added'
    else
      @label.each do |label|
        puts "Label ID: #{label.id}, Title: #{label.title}, Color: #{label.color}"
      end
    end
  end

  def list_books
    puts 'List of all books:'
    if @books.empty?
      puts 'No books added'
    else
      @books.each do |item|
        print "ID: #{item.id}, Publish Date: #{item.publish_date}, Publisher: #{item.publisher}"
        puts " Cover State: #{item.cover_state}, Label ID: #{item.label_id}"
      end
    end
  end
end
