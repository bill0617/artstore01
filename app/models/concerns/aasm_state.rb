module AasmState
	extend ActiveSupport::Concern

	included do
		include AASM

		aasm do
			state :order_placed, initail: true
			state :paid
			state :shipping
			state :shipped
			state :return_good
			state :order_canceled

			event :make_payment, after_commit: :pay! do
				transitions from: :order_placed, to: :paid
			end

			event :ship do
				transitions from: :paid, to: :shipping
			end

			event :deliver do
				transitions from: :shipping, to: :shipped
			end

			event :return do
				transitions from: :shipped, to: :return_good
			end
			event :cancel do
				transitions from: [:order_placed, :paid], to: :order_canceled
			end

		end
	end
end
