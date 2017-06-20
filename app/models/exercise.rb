class Exercise < ApplicationRecord
	belongs_to :workout
	has_one :user, through: :workout

	def is_single?
		Exercise.send(self.name)[:single]
	end

	def is_timed?
		Exercise.send(self.name)[:timed]
	end

	def is_weighted?
		Exercise.send(self.name)[:weighted]
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
		{name: 'calf_raise_squats', weighted: true}
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
		{name: 'dead_lift_squats', single: true, weighted: true}
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
		{name: 'lawnmowers', weighted: true}
	end

	def self.twenty_ones
		{name: 'twenty_ones', weighted: true}
	end

	def self.one_arm_cross_body_curls
		{name: 'one_arm-cross_body_curls', single: true, weighted: true}
	end

	def self.elbows_out_lawnmowers
		{name: 'eighty_twenty_speed_squats', weighted: true}
	end

	def self.standing_bicep_curls
		{name: 'standing_bicep_curls', weighted: true}
	end

	def self.one_arm_contraction_curls
		{name: 'eighty_twenty_speed_squats', single: true, weighted: true}
	end

	def self.corn_cob_pull_ups
		{name: 'corn_cob_pull_ups'}
	end

	def self.reverse_grip_bent_over_rows
		{name: 'reverse_grip_bent_over_rows', weighted: true}
	end

	def self.open_arm_curls
		{name: 'open_arm_curls', weighted: true}
	end

	def self.static_arm_curls
		{name: 'static_arm_curls', weighted: true}
	end

	def self.towel_pull_ups
		{name: 'towel_pull_ups'}
	end

	def self.congdon_locomotives
		{name: 'congdon_locomotives', weighted: true}
	end

	def self.crouching_cohen_curls
		{name: 'crouching_cohen_curls', weighted: true}
	end

	def self.one_arm_corkscrew_curls
		{name: 'one_arm_corkscrew_curls', single: true, weighted: true}
	end

	def self.chin_ups
		{name: 'chin_ups'}
	end

	def self.seated_bent_over_back_flys
		{name: 'seated_bent_over_back_flys', weighted: true}
	end

	def self.curl_up_hammer_downs
		{name: 'curl_up_hammer_downs', weighted: true}
	end

	def self.hammer_curls
		{name: 'hammer_curls', weighted: true}
	end

	def self.max_rep_pull_ups
		{name: 'max_rep_pull_ups'}
	end

	def self.superman
		{name: 'superman'}
	end

	def self.in_out_hammer_curls
		{name: 'in_out_hammer_curls', weighted: true}
	end

	def self.strip_set_curls
		{name: 'strip_set_curls', weighted: true}
	end

	def self.alternating_shoulder_press
		{name: 'alternating_shoulder_press', weighted: true}
	end

	def self.in_and_out_bicep_curls
		{name: 'in_and_out_bicep_curls', weighted: true}
	end

	def self.two_arm_triceps_kickback
		{name: "two_arm_triceps_kickback", weighted: true}
	end

	def self.deep_swimmer_presses
		{name: "deep_swimmer_presses", weighted: true}
	end

	def self.full_supination_concentration_curls
		{name: "full_supination_concentration_curls", weighted: true}
	end

	def self.chair_dips
		{name: "chair_dips"}
	end

	def self.upright_rows
		{name: "upright_rows", weighted: true}
	end

	def self.flip_grip_twist_triceps_kickbacks
		{name: "flip_grip_twist_triceps_kickbacks", weighted: true}
	end

	def self.seated_two_angle_shoulder_flys
		{name: "seated_two_angle_shoulder_flys", weighted: true}
	end

	def self.lying_down_triceps_extensions
		{name: "lying_down_triceps_extensions", weighted: true}
	end

	def self.in_and_out_straight_arm_shoulder_flys
		{name: "in_and_out_straight_arm_shoulder_flys", weighted: true}
	end

	def self.congdon_curls
		{name: "congdon_curls", weighted: true}
	end

	def self.side_tri_rises
		{name: "side_tri_rises"}
	end
end
