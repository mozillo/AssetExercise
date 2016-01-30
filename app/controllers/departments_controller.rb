class DepartmentsController < ApplicationController
  before_action :set_department, only: [:show, :edit, :update, :destroy]

  # GET /departments
  # GET /departments.json
  def index
    
    if current_admin.is_master
      @filterrific = initialize_filterrific(
        Department,
        params[:filterrific]
      ) or return
      @departments = @filterrific.find.paginate(:page => params[:page])
    else
      @filterrific = initialize_filterrific(
        Department,
        params[:filterrific]
      ) or return
      @departments = @filterrific.find.where(:admin => current_admin).paginate(:page => params[:page])
    end

  end

  # GET /departments/1
  # GET /departments/1.json
  def show
    @users = User.where(:dept_uuid => @department.dept_uuid)

    @forbidden = (@department.admin_id != current_admin.id)

  end

  # GET /departments/new
  def new
    @department = Department.new
  end

  # GET /departments/1/edit
  def edit
  end

  # POST /departments
  # POST /departments.json
  def create
    @department = Department.new(department_params)
    @department.admin_id = current_admin.id

    respond_to do |format|
      if @department.save
        format.html { redirect_to department_path(@department.dept_uuid), notice: 'Department was successfully created.' }
        format.json { render :show, status: :created, location: @department }
      else
        format.html { render :new }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /departments/1
  # PATCH/PUT /departments/1.json
  def update

    # return render :json => params
    respond_to do |format|
      if @department.update(department_params)
        format.html { redirect_to department_path(@department.dept_uuid), notice: 'Department was successfully updated.' }
        format.json { render :show, status: :ok, location: @department }
      else
        format.html { render :edit }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departments/1
  # DELETE /departments/1.json
  def destroy
    @department.destroy
    respond_to do |format|
      format.html { redirect_to departments_url, notice: 'Department was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_department
      @department = Department.find_by(:dept_uuid => params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def department_params
      params.require(:department).permit(:department_name, :dept_uuid, :budget)
    end
end
