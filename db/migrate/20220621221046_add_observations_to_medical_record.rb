class AddObservationsToMedicalRecord < ActiveRecord::Migration[7.0]
  def change
    add_column :medical_records, :observations, :text
  end
end
