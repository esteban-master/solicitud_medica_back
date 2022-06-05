class AddAttendedToMedicalCares < ActiveRecord::Migration[7.0]
  def change
    add_column :medical_cares, :attended, :boolean
    add_column :medical_cares, :date, :datetime
  end
end
