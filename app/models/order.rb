class Order < ActiveRecord::Base
	belongs_to :user
	has_many :items, class_name: "OrderItem", dependent: :destroy
	has_one :info, class_name: "OrderInfo", dependent: :destroy
	accepts_nested_attributes_for :info
	# validates_associated :info

	include Tokenable
	include AasmState

	def build_item_from_cart(cart)
		cart.items.each do |product|
			item = items.build
			item.product_name = product.title
			item.price = product.price
			item.quantity = cart.find_cart_item(product).quantity
			item.save
		end
	end


	def calculate_total!(cart)
		self.total = cart.total_price
		self.save
	end

	def set_payment_with!(method)
		self.update_columns(payment_method: method)
	end

	def pay!
		self.update(is_paid: true)
	end

	

	
end
