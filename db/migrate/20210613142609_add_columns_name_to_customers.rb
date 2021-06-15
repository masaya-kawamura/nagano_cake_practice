class AddColumnsNameToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :first_name, :string
    add_column :customers, :last_name, :string
    add_column :customers, :first_name_kana, :string
    add_column :customers, :last_name_kana, :string
    add_column :customers, :postcode, :integer
    add_column :customers, :address, :string
    add_column :customers, :is_valid, :boolean, default: true, null: false
  end
end
