class AssetManage < ActiveRecord::Base
	
	self.primary_key = :seq
	self.per_page = 100

	has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/


	filterrific(
	  available_filters: [
	  	:sorted_by,
	    :search_query,
	  ]
	)

  scope :search_query, lambda { |query|
    where("seq like \"%#{query}%\" OR product like \"%#{query}%\"")
  }

	# scope :sorted_by, lambda { |sort_option|
	#   direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
	#   case sort_option.to_s
	#   when /^department_name/
	#     order("LOWER(departments.department_name) #{ direction }")
	#   else
	#     raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
	#   end
	# }
	
	belongs_to :admin,	
						 :foreign_key => :owner_id
	
	has_many :logs, 
  				 :primary_key => :seq, 
  				 :foreign_key => :asset_manage_seq 

	#validates :seq, :precense => true

end
