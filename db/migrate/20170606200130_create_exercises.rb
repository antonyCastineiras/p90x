class CreateExercises < ActiveRecord::Migration[5.0]
  def change
    create_table :exercises do |t|
      t.string :name
      t.integer :weight
      t.boolean :correct_weight
      t.integer :left_reps
      t.integer :right_reps
      t.integer :reps
      t.integer :duration_completed
      t.text :notes
      t.references :workout

      t.timestamps
    end
  end
end
