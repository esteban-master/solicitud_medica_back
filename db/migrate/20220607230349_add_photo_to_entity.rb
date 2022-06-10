class AddPhotoToEntity < ActiveRecord::Migration[7.0]
  def change
    add_column :entities, :photo, :string
  end
end
