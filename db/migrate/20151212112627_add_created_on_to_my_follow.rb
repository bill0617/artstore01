class AddCreatedOnToMyFollow < ActiveRecord::Migration
  def change
  	add_column :my_follows, :created_on, :date
  	add_column :my_follows, :updated_on, :date
  end
end
