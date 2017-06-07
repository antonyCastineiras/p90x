class Exercise < ApplicationRecord
	belongs_to :workout

	def is_single?
		Exercise.send(self.name)[:single]
	end

	def is_timed?
		Exercise.send(self.name)[:timed]
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
end
