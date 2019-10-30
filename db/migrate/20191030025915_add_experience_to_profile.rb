class AddExperienceToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :experience, :integer
  end
end
