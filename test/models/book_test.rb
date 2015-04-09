require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @book = Book.new
  end

  test 'title remembers its value' do
    @book.title = 'The Hobbit'
    assert_equal 'The Hobbit', @book.title
  end

  test 'author remembers its value' do
    @book.author = 'Tolkien'
    assert_equal 'Tolkien', @book.author
  end

  test 'pages remembers its value' do
    @book.pages = 768
    assert_equal 768, @book.pages
  end

  test 'persistence works properly' do
    created_book = Book.create(title: 'Snow Crash', author: 'Neal Stephenson', pages: 440, price: 12.99)
    found_book = Book.find created_book.id
    assert_not_nil found_book
    assert_equal 'Snow Crash', found_book.title
    assert_equal 'Neal Stephenson', found_book.author
    assert_equal 440, found_book.pages
  end

  test "update from a fixture" do
    book = books(:ender)
    delta = 0.001    
    assert_in_delta 4.83, book.price, delta
    book.price = 3.99
    book.save
    updated = Book.find(book.id)
    assert_in_delta 3.99, updated.price, delta
  end

end
