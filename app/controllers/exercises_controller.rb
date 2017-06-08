class ExercisesController < ApplicationController
  def update
  	@exercise = Exercise.find(params[:id])
  	@exercise.update(exercise_update_params)
  end

  private

  def exercise_update_params
  	params.require(:exercise).permit(:right_reps,:left_reps,:reps,:duration_completed)
  end
end
