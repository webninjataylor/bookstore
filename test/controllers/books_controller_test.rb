require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:books)
  end

  test "should get show" do
    get :show, id: books(:ender).id
    assert_response :success
    book = assigns(:book)
    assert_not_nil book
    assert_equal "Ender's Game", book.title
  end
end