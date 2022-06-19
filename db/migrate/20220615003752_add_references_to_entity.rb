class AddReferencesToEntity < ActiveRecord::Migration[7.0]
  def change
    add_reference :entities, :health_professional, foreign_key: true
    add_reference :entities, :patient, foreign_key: true
  end
end
