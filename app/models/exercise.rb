class Exercise < ApplicationRecord
	belongs_to :workout
	has_one :user, through: :workout

	def is_single?
		Exercise.send(self.name)[:single]
	end

	def is_timed?
		Exercise.send(self.name)[:timed]
	end

	def results
		return {left: left_reps, right: right_reps} if is_single?
		return duration_completed if is_timed?
		return reps
	end

	def previous_attempt
		exercise = last_similar_exercise
		!exercise.nil? ? exercise.results : "no previous attempt"
	end

	def last_similar_exercise
		user.workouts.order(created_at: :desc).each do |workout|
			next if workout == self.workout
			workout.exercises.each do |exercise|
				return exercise if exercise.name == self.name
			end
		end 
		nil
	end

	def self.balance_lunges
		{name: 'balance_lunges', single: true}
	end

	def self.calf_raise_squats
		{name: 'calf_raise_squats'}
	end

	def self.reverse_grip_pull_ups
		{name: 'reverse_grip_pull_ups'}
	end

	def self.super_skaters
		{name: 'super_skaters', single: true}
	end

	def self.wall_squats
		{name: 'wall_squats', timed: true}
	end

	def self.wide_grip_pull_ups
		{name: 'wide_grip_pull_ups'}
	end

	def self.step_back_lunges
		{name: 'step_back_lunges', single: true}
	end

	def self.alternating_side_lunges
		{name: 'alternating_side_lunges', single: true}
	end

	def self.close_grip_pull_ups
		{name: 'close_grip_pull_ups'}
	end

	def self.single_leg_wall_squat
		{name: 'single_leg_wall_squat', timed: true}
	end

	def self.dead_lift_squats
		{name: 'dead_lift_squats', single: true}
	end

	def self.switch_grip_pull_ups
		{name: 'switch_grip_pull_ups'}
	end

	def self.three_way_lunges
		{name: 'three_way_lunges', single: true}
	end

	def self.sneaky_lunges
		{name: 'sneaky_lunges'}
	end

	def self.chair_salutations
		{name: 'chair_salutations', timed: true}
	end

	def self.toe_roll_iso_lunges
		{name: 'toe_roll_iso_lunges', single: true}
	end

	def self.wide_front_pull_ups
		{name: 'wide_front_pull_ups'}
	end

	def self.groucho_walk
		{name: 'groucho_walk', timed: true}
	end

	def self.calf_raises
		{name: 'calf_raises'}
	end

	def self.eighty_twenty_speed_squats
		{name: 'eighty_twenty_speed_squats', single: true}
	end

	def self.lawnmowers
		{name: 'lawnmowers'}
	end

	def self.twenty_ones
		{name: 'twenty_ones'}
	end

	def self.one_arm_cross_body_curls
		{name: 'one_arm-cross_body_curls', single: true}
	end

	def self.elbows_out_lawnmowers
		{name: 'eighty_twenty_speed_squats'}
	end

	def self.standing_bicep_curls
		{name: 'standing_bicep_curls'}
	end

	def self.one_arm_contraction_curls
		{name: 'eighty_twenty_speed_squats', single: true}
	end

	def self.corn_cob_pull_ups
		{name: 'corn_cob_pull_ups'}
	end

	def self.reverse_grip_bent_over_rows
		{name: 'reverse_grip_bent_over_rows'}
	end

	def self.open_arm_curls
		{name: 'open_arm_curls'}
	end

	def self.static_arm_curls
		{name: 'static_arm_curls'}
	end

	def self.towel_pull_ups
		{name: 'towel_pull_ups'}
	end

	def self.congdon_locomotives
		{name: 'congdon_locomotives'}
	end

	def self.crouching_cohen_curls
		{name: 'crouching_cohen_curls'}
	end

	def self.one_arm_corkscrew_curls
		{name: 'one_arm_corkscrew_curls', single: true}
	end

	def self.chin_ups
		{name: 'chin_ups'}
	end

	def self.seated_bent_over_back_flys
		{name: 'seated_bent_over_back_flys'}
	end

	def self.curl_up_hammer_downs
		{name: 'curl_up_hammer_downs'}
	end

	def self.hammer_curls
		{name: 'hammer_curls'}
	end

	def self.max_rep_pull_ups
		{name: 'max_rep_pull_ups'}
	end

	def self.superman
		{name: 'superman'}
	end

	def self.in_out_hammer_curls
		{name: 'in_out_hammer_curls'}
	end

	def self.strip_set_curls
		{name: 'strip_set_curls'}
	end
end
