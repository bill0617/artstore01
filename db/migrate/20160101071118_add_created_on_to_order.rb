class AddCreatedOnToOrder < ActiveRecord::Migration
  def change
   add_column :orders, :created_on, :date
  end
end
