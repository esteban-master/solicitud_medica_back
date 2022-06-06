class Changecolumntohealthprofession < ActiveRecord::Migration[7.0]
  def change
    rename_column :health_professionals, :professions_id, :profession_id
  end
end
