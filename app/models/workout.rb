class Workout < ApplicationRecord
	belongs_to :user
	has_many :exercises

	validates :name, presence: true
	after_validation :create_exercises

	def create_exercises
	end
end
