class AssetManagesController < ApplicationController
  before_action :set_asset_manage, only: [:in, :out, :show, :edit, :update, :destroy]

  # GET /asset_manages
  # GET /asset_manages.json
  def index
    @filterrific = initialize_filterrific(
      AssetManage,
      params[:filterrific]
    ) or return
    @asset_manages = @filterrific.find.paginate(:page => params[:page])
    #@asset_manages = AssetManage.all
  end

  # GET /asset_manages/1
  # GET /asset_manages/1.json
  def show
    @logs = Log.where(:asset_manage => @asset_manage)
    @graph = Hash.new
    @logs.each do |log|
      next if log.user == nil
      next if log.action_type == 'in'
      if @graph[log.user.department.department_name] == nil
        @graph[log.user.department.department_name] = 0
      end
      @graph[log.user.department.department_name] = @graph[log.user.department.department_name] + log.qty
    end
  end

  # GET /asset_manages/new
  def new
    @asset_manage = AssetManage.new
  end

  # GET /asset_manages/1/edit
  def edit
  end

  # POST /asset_manages
  # POST /asset_manages.json
  def create
    @asset_manage = AssetManage.new(asset_manage_params)
    @asset_manage.admin = current_admin
    
    respond_to do |format|
      if @asset_manage.save
        format.html { redirect_to @asset_manage, notice: 'Asset manage was successfully created.' }
        format.json { render :show, status: :created, location: @asset_manage }
      else
        format.html { render :new }
        format.json { render json: @asset_manage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /asset_manages/1
  # PATCH/PUT /asset_manages/1.json
  def update
    respond_to do |format|
      if @asset_manage.update(asset_manage_params)
        format.html { redirect_to @asset_manage, notice: 'Asset manage was successfully updated.' }
        format.json { render :show, status: :ok, location: @asset_manage }
      else
        format.html { render :edit }
        format.json { render json: @asset_manage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /asset_manages/1
  # DELETE /asset_manages/1.json
  def destroy
    @asset_manage.destroy
    respond_to do |format|
      format.html { redirect_to asset_manages_url, notice: 'Asset manage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def in
    @log = Log.new
    @log.admin = current_admin
    @log.action_type = 'in';
    @log.asset_manage = @asset_manage
  end

  def out
    @log = Log.new
    @log.admin = current_admin
    @log.action_type = 'out';
    @log.asset_manage = @asset_manage
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asset_manage
      params[:id] ? 
        @asset_manage = AssetManage.find(params[:id]) :
        @asset_manage = AssetManage.find_by(:seq => params[:asset_manage_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def asset_manage_params
      params.require(:asset_manage).permit(:brand, :category, :model, :producer, :product, :photo, :price, :qty, :stock_in_number, :stock_out_number, :unit, :remarks, :seq)
    end
end
