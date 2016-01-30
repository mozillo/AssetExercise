class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_admin!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    
    if current_admin.is_master === false
      return redirect_to dashboard_path
    end

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

  def dashboard
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

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password) }
  end
end
