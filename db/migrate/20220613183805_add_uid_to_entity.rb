class AddUidToEntity < ActiveRecord::Migration[7.0]
  def change
    add_column :entities, :uid, :string
    add_index :entities, :uid
  end
end
