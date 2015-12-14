class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
    	t.string :brand_image
      t.timestamps null: false
    end
  end
end
