require "test_helper"

class FeedbackAuthorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @feedback_author = feedback_authors(:one)
  end

  test "should get index" do
    get feedback_authors_url
    assert_response :success
  end

  test "should get new" do
    get new_feedback_author_url
    assert_response :success
  end

  test "should create feedback_author" do
    assert_difference("FeedbackAuthor.count") do
      post feedback_authors_url, params: { feedback_author: { author_id: @feedback_author.author_id, feedback: @feedback_author.feedback, user_id: @feedback_author.user_id } }
    end

    assert_redirected_to feedback_author_url(FeedbackAuthor.last)
  end

  test "should show feedback_author" do
    get feedback_author_url(@feedback_author)
    assert_response :success
  end

  test "should get edit" do
    get edit_feedback_author_url(@feedback_author)
    assert_response :success
  end

  test "should update feedback_author" do
    patch feedback_author_url(@feedback_author), params: { feedback_author: { author_id: @feedback_author.author_id, feedback: @feedback_author.feedback, user_id: @feedback_author.user_id } }
    assert_redirected_to feedback_author_url(@feedback_author)
  end

  test "should destroy feedback_author" do
    assert_difference("FeedbackAuthor.count", -1) do
      delete feedback_author_url(@feedback_author)
    end

    assert_redirected_to feedback_authors_url
  end
end
