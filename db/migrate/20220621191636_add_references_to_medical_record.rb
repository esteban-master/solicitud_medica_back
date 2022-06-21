class AddReferencesToMedicalRecord < ActiveRecord::Migration[7.0]
  def change
    add_reference :medical_records, :health_professional, foreign_key: true
  end
end
