class Group < ActiveRecord::Base
	has_many :users

	belongs_to :admin
end
