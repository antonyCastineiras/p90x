class Workout < ApplicationRecord
	belongs_to :user
	has_many :exercises, dependent: :destroy
	accepts_nested_attributes_for :exercises

	validates :name, presence: true
	after_save :create_exercises

	WORKOUT_NAMES = [:legs_and_back]

	def create_exercises
		exercise_names = get_exercise_names
		exercise_names.each  {|exercise_name|
			Exercise.create({name: exercise_name, workout: self})
		} 
	end

	def get_exercise_names
		self.send(self.name + '_exercises')
	end

	def legs_and_back_exercises
		[:balance_lunges, :calf_raise_squats, :reverse_grip_pull_ups, :super_skaters, :wall_squats, :wide_grip_pull_ups, :step_back_lunges, :alternating_side_lunges, :close_grip_pull_ups, :single_leg_wall_squat, :dead_lift_squats, :switch_grip_pull_ups, :three_way_lunges, :sneaky_lunges, :reverse_grip_pull_ups, :chair_salutations, :toe_roll_iso_lunges, :wide_front_pull_ups, :groucho_walk, :calf_raises, :close_grip_pull_ups, :eighty_twenty_speed_squats, :switch_grip_pull_ups]
	end
end
