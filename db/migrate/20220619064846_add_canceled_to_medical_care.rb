class AddCanceledToMedicalCare < ActiveRecord::Migration[7.0]
  def change
    add_column :medical_cares, :canceled, :boolean, default: false
  end
end
