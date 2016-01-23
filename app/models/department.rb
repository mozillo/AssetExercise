class Department < ActiveRecord::Base

	self.primary_key = 'dept_uuid'
	self.per_page = 100

	filterrific(
	  available_filters: [
	  	:sorted_by,
	    :search_query,
	  ]
	)

  scope :search_query, lambda { |query|
    where("department_name like \"%#{query}%\"")
  }

	scope :sorted_by, lambda { |sort_option|
	  direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
	  case sort_option.to_s
	  when /^department_name/
	    order("LOWER(departments.department_name) #{ direction }")
	  else
	    raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
	  end
	}
	
	has_many :user, :foreign_key => :dept_uuid
	before_create :before_create
	
	protected
	def before_create
		self.dept_uuid = UUIDTools::UUID.random_create
	end

end
