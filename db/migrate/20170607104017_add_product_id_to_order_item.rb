class AddProductIdToOrderItem < ActiveRecord::Migration[5.0]
  def change
   add_column :order_items, :brand_id, :integer    
  end
end
