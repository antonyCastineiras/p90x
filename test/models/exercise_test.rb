require 'test_helper'

class ExerciseTest < ActiveSupport::TestCase

	def setup
		@exercise = Exercise.new
	end

  test "is_single? returns true when the exercise is single limb" do
  	@exercise.name = "balance_lunges"
  	assert @exercise.is_single?
  end

  test "is_single? returns false when the exercise is not single limb" do
  	@exercise.name = "reverse_grip_pull_ups"
  	assert_not @exercise.is_single?
  end

  test "is_timed? returns true when exercise is timed" do
  	@exercise.name = "wall_squats"
  	assert @exercise.is_timed?
  end

  test "is_timed? returns false when the exercise is not timed" do
  	@exercise.name = "reverse_grip_pull_ups"
  	assert_not @exercise.is_timed?
  end

  test "is_weighted returns true when the exercise is weighted" do
  	@exercise.name = "calf_raise_squats"
  	assert @exercise.is_weighted?
  end

  test "is_weighted? returns false when he exercise is not weighted" do
  	@exercise.name = "reverse_grip_pull_ups"
  	assert_not @exercise.is_weighted?
  end

  test "results returns a Hash if exercise is_single" do 
  	@exercise.name = "balance_lunges"
  	assert @exercise.results.is_a?(Hash)
  end

  test "results returns the exercises reps" do
  	@exercise.name = "reverse_grip_pull_ups"
  	@exercise.reps = 10
  	assert @exercise.results == 10
  end
end
