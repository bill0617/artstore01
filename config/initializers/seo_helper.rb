SeoHelper.configure do |config|
	config.site_name = "ArtStore Shop Net"
	config.site_name_formatter = lambda { |title, site_name| "#{title} - #{site_name}" } 
end