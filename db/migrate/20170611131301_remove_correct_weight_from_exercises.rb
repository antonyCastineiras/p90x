class RemoveCorrectWeightFromExercises < ActiveRecord::Migration[5.0]
  def change
    remove_column :exercises, :correct_weight, :boolean
  end
end
