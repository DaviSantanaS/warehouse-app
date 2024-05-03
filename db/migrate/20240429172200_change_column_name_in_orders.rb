class ChangeColumnNameInOrders < ActiveRecord::Migration[7.1]
  def change
    rename_column :orders, :estimate_delivery_date, :estimated_delivery_date
  end
end