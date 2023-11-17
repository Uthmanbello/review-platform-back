require "test_helper"

class FacebookReviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @facebook_review = facebook_reviews(:one)
  end

  test "should get index" do
    get facebook_reviews_url
    assert_response :success
  end

  test "should get new" do
    get new_facebook_review_url
    assert_response :success
  end

  test "should create facebook_review" do
    assert_difference("FacebookReview.count") do
      post facebook_reviews_url, params: { facebook_review: { full_name: @facebook_review.full_name, review_text: @facebook_review.review_text, username: @facebook_review.username } }
    end

    assert_redirected_to facebook_review_url(FacebookReview.last)
  end

  test "should show facebook_review" do
    get facebook_review_url(@facebook_review)
    assert_response :success
  end

  test "should get edit" do
    get edit_facebook_review_url(@facebook_review)
    assert_response :success
  end

  test "should update facebook_review" do
    patch facebook_review_url(@facebook_review), params: { facebook_review: { full_name: @facebook_review.full_name, review_text: @facebook_review.review_text, username: @facebook_review.username } }
    assert_redirected_to facebook_review_url(@facebook_review)
  end

  test "should destroy facebook_review" do
    assert_difference("FacebookReview.count", -1) do
      delete facebook_review_url(@facebook_review)
    end

    assert_redirected_to facebook_reviews_url
  end
end
