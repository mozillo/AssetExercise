class AssetManage < ActiveRecord::Base
	
	self.primary_key = :seq

	has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

	belongs_to :admin,	
						 :foreign_key => :owner_id, 
						 :primary_key => :id
	
	has_many :logs

end
