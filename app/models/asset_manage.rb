class AssetManage < ActiveRecord::Base

	

	before_create 	:before_create	
	before_save 		:before_save


	protected
	def before_create

	end

	def before_save
		
	end

end
