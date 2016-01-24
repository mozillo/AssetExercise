class Log < ActiveRecord::Base
	
	belongs_to :asset_manage, 
						 :foreign_key => :asset_manage_seq

	belongs_to :admin
	belongs_to :user, 
						 :foreign_key => :user_uuid

	after_destroy :restore_qty


	def restore_qty
		asset_manage = self.asset_manage
		if self.action_type == 'in'
			asset_manage.qty = asset_manage.qty.to_i - self.qty
			
			if asset_manage.qty.to_i < 0
				asset_manage.qty = 0
			end

		elsif self.action_type == 'out'  
			asset_manage.qty = asset_manage.qty.to_i + self.qty
		end

		asset_manage.save
	end

end
