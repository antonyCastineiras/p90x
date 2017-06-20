require 'test_helper'

class WorkoutTest < ActiveSupport::TestCase
  def setup
  	@workout = Workout.new(name: 'legs_and_back', user: User.new)
  end

  test "invalid without name" do
  	@workout.name = nil
  	refute @workout.valid?
  	assert_not_nil @workout.errors[:name]
  end

  test "it creates exercises after save" do
  	@workout.save!
  	assert @workout.exercises.count > 0, "no exercises have been created"
  end

  test "get_exercise_names returns an array" do
  	assert @workout.get_exercise_names.is_a?(Array), "get_exercise_names is not returning an array"
  end

  test "get_exercise_names returns the same as method with same name" do
  	exercise_names = @workout.get_exercise_names
  	expected_names = @workout.legs_and_back_exercises
  	assert exercise_names == expected_names
  end
end
