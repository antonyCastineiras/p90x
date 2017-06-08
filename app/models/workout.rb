class Workout < ApplicationRecord
	belongs_to :user
	has_many :exercises, dependent: :destroy
	accepts_nested_attributes_for :exercises

	validates :name, presence: true
	after_create :create_exercises

	WORKOUT_NAMES = [:legs_and_back, :back_and_biceps]

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

	def back_and_biceps_exercises
		[:wide_front_pull_ups, :lawnmowers, :twenty_ones, :one_arm_cross_body_curls, :switch_grip_pull_ups, :elbows_out_lawnmowers, :standing_bicep_curls, :one_arm_contraction_curls, :corn_cob_pull_ups, :reverse_grip_bent_over_rows, :open_arm_curls, :static_arm_curls, :towel_pull_ups, :congdon_locomotives, :crouching_cohen_curls, :one_arm_corkscrew_curls, :chin_ups, :seated_bent_over_back_flys, :curl_up_hammer_downs, :hammer_curls, :max_rep_pull_ups, :superman, :in_out_hammer_curls, :strip_set_curls]
	end
end
