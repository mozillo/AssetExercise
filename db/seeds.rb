# creek = Creek::Book.new "public/imports/asset-manages.xlsx"
# sheets = creek.sheets[0]
# sheets.rows.each do |row|
# 	asset_manage = AssetManage.new
# 	row.each do |key, value|
# 		flag = /[A-Z]/.match key
# 		flag = flag.to_s
# 		case flag
# 		when "A"
# 			asset_manage.seq = value
# 			if AssetManage.where(:seq => asset_manage.seq).size >= 1
# 				asset_manage.seq = "duplicate_#{SecureRandom.urlsafe_base64(nil, false)}"
# 			end
# 		when "B"
# 			asset_manage.category = value
# 		when "C"
# 			asset_manage.product = value
# 		when "D"
# 			asset_manage.brand = value
# 		when "E"
# 			asset_manage.model = value
# 		when "F"
# 			asset_manage.price = value
# 		when "G"
# 			asset_manage.qty = value
# 		end
# 		asset_manage.save
# 	end
# end


creek = Creek::Book.new "public/imports/budget.xlsx"
@sheets = creek.sheets[0]
@sheets.rows.each do |row|
	user = User.new
	row.each do |key, value|
		flag = /[A-Z]/.match key
		flag = flag.to_s
		case flag
		when "A"
			user.username = value.to_s
		when "B"
			user.budget = value.to_i
		when "C"
			department = Department.where(:department_name => value).first_or_create
			user.dept_uuid = department.dept_uuid
		end
	end
	user.save
end