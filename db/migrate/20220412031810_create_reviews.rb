class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.references :entity, null: false, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
