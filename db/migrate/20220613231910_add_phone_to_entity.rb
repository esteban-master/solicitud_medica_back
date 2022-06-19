class AddPhoneToEntity < ActiveRecord::Migration[7.0]
  def change
    add_column :entities, :phone, :string
    add_column :entities, :age, :integer
  end
end
