require 'test_helper'

class ExcercisesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @excercise = excercises(:one)
  end

  test "should get index" do
    get excercises_url
    assert_response :success
  end

  test "should get new" do
    get new_excercise_url
    assert_response :success
  end

  test "should create excercise" do
    assert_difference('Excercise.count') do
      post excercises_url, params: { excercise: { reps: @excercise.reps, sets: @excercise.sets, title: @excercise.title, workout_id: @excercise.workout_id } }
    end

    assert_redirected_to excercise_url(Excercise.last)
  end

  test "should show excercise" do
    get excercise_url(@excercise)
    assert_response :success
  end

  test "should get edit" do
    get edit_excercise_url(@excercise)
    assert_response :success
  end

  test "should update excercise" do
    patch excercise_url(@excercise), params: { excercise: { reps: @excercise.reps, sets: @excercise.sets, title: @excercise.title, workout_id: @excercise.workout_id } }
    assert_redirected_to excercise_url(@excercise)
  end

  test "should destroy excercise" do
    assert_difference('Excercise.count', -1) do
      delete excercise_url(@excercise)
    end

    assert_redirected_to excercises_url
  end
end
