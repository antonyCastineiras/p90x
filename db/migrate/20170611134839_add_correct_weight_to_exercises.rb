class AddCorrectWeightToExercises < ActiveRecord::Migration[5.0]
  def change
    add_column :exercises, :correct_weight, :string
  end
end
