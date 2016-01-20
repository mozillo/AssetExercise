class AssetManagesController < ApplicationController
  before_action :set_asset_manage, only: [:show, :edit, :update, :destroy]

  # GET /asset_manages
  # GET /asset_manages.json
  def index
    @asset_manages = AssetManage.all
  end

  # GET /asset_manages/1
  # GET /asset_manages/1.json
  def show
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asset_manage
      @asset_manage = AssetManage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def asset_manage_params
      params.require(:asset_manage).permit(:brand, :category, :model, :owner_id, :producer, :product, :price, :qty, :stock_in_number, :stock_out_number, :unit, :remarks, :seq)
    end
end
