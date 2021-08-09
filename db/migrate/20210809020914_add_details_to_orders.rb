class AddDetailsToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :payment_intent_id, :string
    add_column :orders, :receipt_url, :string
  end
end
