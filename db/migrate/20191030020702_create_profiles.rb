class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.text :about_me
      t.integer :age
      t.string :gender

      t.timestamps
    end
  end
end
