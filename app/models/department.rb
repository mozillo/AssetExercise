class Department < ActiveRecord::Base
	has_many :user, :foreign_key => :dept_uuid


	before_create :before_create
		
	def id
		dept_uuid
	end

	protected
	def before_create
		self.dept_uuid = UUIDTools::UUID.random_create
	end

end
