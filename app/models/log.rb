class Log < ActiveRecord::Base
	
	belongs_to :asset_manage,
	 					 :foreign_key => :asset_manage_seq

	belongs_to :admin
	belongs_to :user

end
