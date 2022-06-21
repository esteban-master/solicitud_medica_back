class CreateMedicineLines < ActiveRecord::Migration[7.0]
  def change
    create_table :medicine_lines do |t|
      t.references :medicine, null: false, foreign_key: true
      t.references :medical_record, null: false, foreign_key: true
      t.timestamps
    end
  end
end
