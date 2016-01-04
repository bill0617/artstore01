class Order < ActiveRecord::Base
	belongs_to :user
	has_many :items, class_name: "OrderItem", dependent: :destroy
	has_one :info, class_name: "OrderInfo", dependent: :destroy
	accepts_nested_attributes_for :info
	

	include AasmState
	include Tokenable


	def build_item_from_cart(cart)
		cart.items.each do |product|
			item = items.build
			item.product_name = product.title
			item.quantity = cart.find_cart_item(product).quantity
			item.price = product.price
			item.save
		end
	end

	def calculate_total!(cart)
		self.total = cart.total_price
		self.save
	end



	def set_payment_with!(card)
		self.payment_method = card
		self.save
	end

	def pay!
		self.is_paid = true
		self.save
	end
end
