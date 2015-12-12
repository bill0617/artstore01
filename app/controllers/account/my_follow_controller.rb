class Account::MyFollowController < ApplicationController
	before_action :authenticate_user!
	
	def index
		@user = current_user
		@product = current_user.item_followeds
	end
end
