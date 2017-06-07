class PagesController < ApplicationController
  def home
  	redirect_to new_workout_path if current_user
  end
end
