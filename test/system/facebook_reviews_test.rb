require "application_system_test_case"

class FacebookReviewsTest < ApplicationSystemTestCase
  setup do
    @facebook_review = facebook_reviews(:one)
  end

  test "visiting the index" do
    visit facebook_reviews_url
    assert_selector "h1", text: "Facebook reviews"
  end

  test "should create facebook review" do
    visit facebook_reviews_url
    click_on "New facebook review"

    fill_in "Full name", with: @facebook_review.full_name
    fill_in "Review text", with: @facebook_review.review_text
    fill_in "Username", with: @facebook_review.username
    click_on "Create Facebook review"

    assert_text "Facebook review was successfully created"
    click_on "Back"
  end

  test "should update Facebook review" do
    visit facebook_review_url(@facebook_review)
    click_on "Edit this facebook review", match: :first

    fill_in "Full name", with: @facebook_review.full_name
    fill_in "Review text", with: @facebook_review.review_text
    fill_in "Username", with: @facebook_review.username
    click_on "Update Facebook review"

    assert_text "Facebook review was successfully updated"
    click_on "Back"
  end

  test "should destroy Facebook review" do
    visit facebook_review_url(@facebook_review)
    click_on "Destroy this facebook review", match: :first

    assert_text "Facebook review was successfully destroyed"
  end
end
