class CreateMyFollows < ActiveRecord::Migration
  def change
    create_table :my_follows do |t|
      t.integer :user_id
      t.integer :product_id
      t.index :user_id
      t.index :product_id
      t.timestamps null: false
    end
  end
end
