class AddHealthProfessionalIdToMedicalCare < ActiveRecord::Migration[7.0]
  def change
    add_reference :medical_cares, :health_professional, null: false, foreign_key: true
  end
end
