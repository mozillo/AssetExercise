class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_admin!

  def index
  	@logOutCount = Log.where(:action_type => 'out').all.collect(&:qty).compact.sum
  	@logInCount = Log.where(:action_type => 'in').all.collect(&:qty).compact.sum

  	@userCount = User.all.count
    @users = User.all.count

    @logs = Log.where(:action_type => 'out')
    @logToDepartment = {}
    @logs.each do |log|
    	if @logToDepartment[log.user.department.department_name] == nil
    		@logToDepartment[log.user.department.department_name] = 0
    	end
    	@logToDepartment[log.user.department.department_name] += log.qty.to_i
    end


    @c1 = {"总出库次数" => @logOutCount, "总入库次数" => @logInCount}
  end

  def export_table_1
  	@write_file = Array.new
    @users = User.all
    respond_to do |format|
      format.xlsx
    end
  end

  def export_table_2
  end
  
end
