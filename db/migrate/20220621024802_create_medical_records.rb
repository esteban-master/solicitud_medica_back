class CreateMedicalRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :medical_records do |t|
      t.datetime :start_date
      t.datetime :end_date

      t.references :patient, null: false, foreign_key: true
      t.timestamps
    end
  end
end
