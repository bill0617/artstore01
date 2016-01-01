class AddAasmToOrder < ActiveRecord::Migration
  def change
  	add_column :orders, :aasm_state, :string
  	add_index :orders, :aasm_state
  end
end
