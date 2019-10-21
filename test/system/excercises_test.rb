require "application_system_test_case"

class ExcercisesTest < ApplicationSystemTestCase
  setup do
    @excercise = excercises(:one)
  end

  test "visiting the index" do
    visit excercises_url
    assert_selector "h1", text: "Excercises"
  end

  test "creating a Excercise" do
    visit excercises_url
    click_on "New Excercise"

    fill_in "Reps", with: @excercise.reps
    fill_in "Sets", with: @excercise.sets
    fill_in "Title", with: @excercise.title
    fill_in "Workout", with: @excercise.workout_id
    click_on "Create Excercise"

    assert_text "Excercise was successfully created"
    click_on "Back"
  end

  test "updating a Excercise" do
    visit excercises_url
    click_on "Edit", match: :first

    fill_in "Reps", with: @excercise.reps
    fill_in "Sets", with: @excercise.sets
    fill_in "Title", with: @excercise.title
    fill_in "Workout", with: @excercise.workout_id
    click_on "Update Excercise"

    assert_text "Excercise was successfully updated"
    click_on "Back"
  end

  test "destroying a Excercise" do
    visit excercises_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Excercise was successfully destroyed"
  end
end
