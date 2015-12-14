class Brand < ActiveRecord::Base
	mount_uploader :brand_image, BrandImageUploader
end
