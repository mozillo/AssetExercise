class LogsController < ApplicationController
  before_action :set_log, only: [:show, :edit, :update, :destroy]

  before_action :set_asset_manage 

  # GET /logs
  # GET /logs.json
  def index
    @logs = Log.paginate(:page => params[:page])
  end

  # GET /logs/1
  # GET /logs/1.json
  def show
  end

  # GET /logs/new
  def new
    @log = Log.new
  end

  # GET /logs/1/edit
  def edit
  end

  # POST /logs
  # POST /logs.json
  def create
    @log = Log.new(log_params)
    @log.admin = current_admin
    @log.asset_manage = @asset_manage;

    if @log.action_type == 'in'
      @asset_manage.qty = @asset_manage.qty.to_i + @log.qty.to_i
    elsif @log.action_type == 'out'
      @asset_manage.qty = @asset_manage.qty.to_i - @log.qty.to_i
      if @asset_manage.qty < 0 
        @asset_manage.qty = 0
      end
    end
    @asset_manage.save

    respond_to do |format|
      if @log.save
        format.html { redirect_to  asset_manage_path(@asset_manage.id), notice: 'Log was successfully created.' }
        format.json { render :show, status: :created, location: @log }
      else
        format.html { render :new }
        format.json { render json: @log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /logs/1
  # PATCH/PUT /logs/1.json
  def update
    respond_to do |format|
      
      @log.restore_qty

      if @log.action_type == 'in'
        @asset_manage.qty = @asset_manage.qty.to_i + @log.qty.to_i
      elsif @log.action_type == 'out'
        @asset_manage.qty = @asset_manage.qty.to_i - @log.qty.to_i
        if @asset_manage.qty < 0 
          @asset_manage.qty = 0
        end
      end
      @asset_manage.save
    
      if @log.update(log_params)
        format.html { redirect_to asset_manage_path(@asset_manage.id), notice: 'Log was successfully updated.' }
        format.json { render :show, status: :ok, location: @log }
      else
        format.html { render :edit }
        format.json { render json: @log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /logs/1
  # DELETE /logs/1.json
  def destroy
    @log.destroy
    respond_to do |format|
      format.html { redirect_to logs_url, notice: 'Log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_asset_manage
      @asset_manage = AssetManage.find_by(:seq => params[:asset_manage_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_log
      @log = Log.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def log_params
      params.require(:log).permit(:user_uuid, :action_type, :qty)
    end
end
