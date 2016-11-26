class RemoveBrandFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :brand, :string
    add_column :products, :brand_id, :integer
  end
end
