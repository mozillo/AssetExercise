class User < ActiveRecord::Base

	belongs_to :department, 
						 :foreign_key => :dept_uuid, 
						 :primary_key => :dept_uuid
						 
	has_many :asset_manages, :foreign_key => :owner_id

	has_many :user_budgets, :foreign_key => :user_id

	before_create :before_create
	protected
	def before_create
		self.uuid = UUIDTools::UUID.random_create
	end

end
