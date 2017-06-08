class WorkoutsController < ApplicationController
	def new
		@workout = Workout.new
	end

	def create
		workout = Workout.new(workout_params)
		workout.user = current_user
		workout.name = lowercase_and_underscore(workout.name)
		if workout.save
			redirect_to after_create_workout_path(workout)
		else 
			flash[:error] = "Unable to create workout"
			redirect_to :back
		end
	end

	def show
		@workout = Workout.find(params[:id])
		@exercises = @workout.exercises
	end

	def edit
		@workout = Workout.find(params[:id])
	end

	def update
		@workout = Workout.find(params[:id])
		@workout.update(workout_params)
		redirect_to after_update_workout_path(@workout)
	end

	private 

	def workout_params
		params.require(:workout).permit(:name, exercises_attributes: [:id, :right_reps, :left_reps, :reps, :duration_completed])
	end

	def after_create_workout_path(workout)
		edit_workout_path(workout)
	end

	def after_update_workout_path(workout)
		workout_path(workout)
	end
end
