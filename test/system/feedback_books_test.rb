require "application_system_test_case"

class FeedbackBooksTest < ApplicationSystemTestCase
  setup do
    @feedback_book = feedback_books(:one)
  end

  test "visiting the index" do
    visit feedback_books_url
    assert_selector "h1", text: "Feedback books"
  end

  test "should create feedback book" do
    visit feedback_books_url
    click_on "New feedback book"

    fill_in "Book", with: @feedback_book.book_id
    fill_in "Feedback", with: @feedback_book.feedback
    fill_in "User", with: @feedback_book.user_id
    click_on "Create Feedback book"

    assert_text "Feedback book was successfully created"
    click_on "Back"
  end

  test "should update Feedback book" do
    visit feedback_book_url(@feedback_book)
    click_on "Edit this feedback book", match: :first

    fill_in "Book", with: @feedback_book.book_id
    fill_in "Feedback", with: @feedback_book.feedback
    fill_in "User", with: @feedback_book.user_id
    click_on "Update Feedback book"

    assert_text "Feedback book was successfully updated"
    click_on "Back"
  end

  test "should destroy Feedback book" do
    visit feedback_book_url(@feedback_book)
    click_on "Destroy this feedback book", match: :first

    assert_text "Feedback book was successfully destroyed"
  end
end
