require "application_system_test_case"

class PhotographsTest < ApplicationSystemTestCase
  setup do
    @photograph = photographs(:one)
  end

  test "visiting the index" do
    visit photographs_url
    assert_selector "h1", text: "Photographs"
  end

  test "should create photograph" do
    visit photographs_url
    click_on "New photograph"

    fill_in "Description", with: @photograph.description
    fill_in "Image", with: @photograph.image
    fill_in "Title", with: @photograph.title
    fill_in "User", with: @photograph.user_id
    click_on "Create Photograph"

    assert_text "Photograph was successfully created"
    click_on "Back"
  end

  test "should update Photograph" do
    visit photograph_url(@photograph)
    click_on "Edit this photograph", match: :first

    fill_in "Description", with: @photograph.description
    fill_in "Image", with: @photograph.image
    fill_in "Title", with: @photograph.title
    fill_in "User", with: @photograph.user_id
    click_on "Update Photograph"

    assert_text "Photograph was successfully updated"
    click_on "Back"
  end

  test "should destroy Photograph" do
    visit photograph_url(@photograph)
    click_on "Destroy this photograph", match: :first

    assert_text "Photograph was successfully destroyed"
  end
end
