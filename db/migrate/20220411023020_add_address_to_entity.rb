class AddAddressToEntity < ActiveRecord::Migration[7.0]
  def change
    add_column :entities, :address, :string
  end
end
