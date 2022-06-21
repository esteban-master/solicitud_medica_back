class CreateDiseasePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :disease_patients do |t|
      t.references :patient, null: false, foreign_key: true
      t.references :disease, null: false, foreign_key: true
      t.timestamps
    end
  end
end
