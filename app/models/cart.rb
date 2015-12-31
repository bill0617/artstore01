class Cart < ActiveRecord::Base
	has_many :cart_items
	has_many :items, through: :cart_items, source: :product

	def add_item_to_cart(product)
		items << product
	end

	def total_price
		items.inject(0) { |sum, item| sum + (item.price * item.quantity)  }
	end
	
end
