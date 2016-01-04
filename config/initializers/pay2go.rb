Pay2go.setup do |pay2go|
		pay2go.merchant_id = ENV['pay2go_merchant_id']
		pay2go.hash_key = ENV['pay2go_hash_key']
		pay2go.hash_iv = ENV['pay2go_hash_iv']
		pay2go.service_url = ENV['pay2go_service_url']
	# else
	# 	pay2go.merchant_id = "11322136"
	# 	pay2go.hash_key = "r5qtNwB0gGsAUaS9SVOoQ1hzhDwuePwG"
	# 	pay2go.hash_iv = "UXaItMJKsbknlcwe"
	# 	pay2go.service_url = "https://capi.pay2go.com/MPG/mpg_gateway"
	
end	

