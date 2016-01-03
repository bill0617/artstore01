Pay2go.setup do |pay2go|
	if Rails.env.development?
		pay2go.merchant_id = "11322136"
		pay2go.hash_key = "r5qtNwB0gGsAUaS9SVOoQ1hzhDwuePwG"
		pay2go.hash_iv = "UXaItMJKsbknlcwe"
		pay2go.service_url = "https://capi.pay2go.com/MPG/mpg_gateway"
	else
		pay2go.merchant_id = "11322136"
		pay2go.hash_key = "r5qtNwB0gGsAUaS9SVOoQ1hzhDwuePwG"
		pay2go.hash_iv = "UXaItMJKsbknlcwe"
		pay2go.service_url = "https://capi.pay2go.com/MPG/mpg_gateway"
	end
end	