class Product < ActiveRecord::Base
	has_attached_file :image, styles: { medium: "500x400#", thumb: "200x200#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
