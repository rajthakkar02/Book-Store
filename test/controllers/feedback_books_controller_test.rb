require "test_helper"

class FeedbackBooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @feedback_book = feedback_books(:one)
  end

  test "should get index" do
    get feedback_books_url
    assert_response :success
  end

  test "should get new" do
    get new_feedback_book_url
    assert_response :success
  end

  test "should create feedback_book" do
    assert_difference("FeedbackBook.count") do
      post feedback_books_url, params: { feedback_book: { book_id: @feedback_book.book_id, feedback: @feedback_book.feedback, user_id: @feedback_book.user_id } }
    end

    assert_redirected_to feedback_book_url(FeedbackBook.last)
  end

  test "should show feedback_book" do
    get feedback_book_url(@feedback_book)
    assert_response :success
  end

  test "should get edit" do
    get edit_feedback_book_url(@feedback_book)
    assert_response :success
  end

  test "should update feedback_book" do
    patch feedback_book_url(@feedback_book), params: { feedback_book: { book_id: @feedback_book.book_id, feedback: @feedback_book.feedback, user_id: @feedback_book.user_id } }
    assert_redirected_to feedback_book_url(@feedback_book)
  end

  test "should destroy feedback_book" do
    assert_difference("FeedbackBook.count", -1) do
      delete feedback_book_url(@feedback_book)
    end

    assert_redirected_to feedback_books_url
  end
end
