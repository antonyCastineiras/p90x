class WorkoutsController < ApplicationController
	def new
		@workout = Workout.new
	end

	def create
		workout = Workout.new(workout_params)
		workout.user = current_user
		if workout.save
			redirect_to after_create_workout_path(workout)
		else 
			flash[:error] = "Unable to create workout"
			redirect_to :back
		end
	end

	def show
		@workout = Workout.find(params[:id])
		@exercises = @workout.exercises.reverse
	end

	private 

	def workout_params
		params.require(:workout).permit(:name)
	end

	def after_create_workout_path(workout)
		workout_path(workout)
	end
end
