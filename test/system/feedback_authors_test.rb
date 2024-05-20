require "application_system_test_case"

class FeedbackAuthorsTest < ApplicationSystemTestCase
  setup do
    @feedback_author = feedback_authors(:one)
  end

  test "visiting the index" do
    visit feedback_authors_url
    assert_selector "h1", text: "Feedback authors"
  end

  test "should create feedback author" do
    visit feedback_authors_url
    click_on "New feedback author"

    fill_in "Author", with: @feedback_author.author_id
    fill_in "Feedback", with: @feedback_author.feedback
    fill_in "User", with: @feedback_author.user_id
    click_on "Create Feedback author"

    assert_text "Feedback author was successfully created"
    click_on "Back"
  end

  test "should update Feedback author" do
    visit feedback_author_url(@feedback_author)
    click_on "Edit this feedback author", match: :first

    fill_in "Author", with: @feedback_author.author_id
    fill_in "Feedback", with: @feedback_author.feedback
    fill_in "User", with: @feedback_author.user_id
    click_on "Update Feedback author"

    assert_text "Feedback author was successfully updated"
    click_on "Back"
  end

  test "should destroy Feedback author" do
    visit feedback_author_url(@feedback_author)
    click_on "Destroy this feedback author", match: :first

    assert_text "Feedback author was successfully destroyed"
  end
end
