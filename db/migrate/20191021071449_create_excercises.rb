class CreateExcercises < ActiveRecord::Migration[5.2]
  def change
    create_table :excercises do |t|
      t.string :title
      t.integer :sets
      t.integer :reps
      t.references :workout, foreign_key: true

      t.timestamps
    end
  end
end
