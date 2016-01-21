class UserBudgetsController < ApplicationController
  before_action :set_user_budget, only: [:show, :edit, :update, :destroy]

  # GET /user_budgets
  # GET /user_budgets.json
  def index
    @user_budgets = UserBudget.all
  end

  # GET /user_budgets/1
  # GET /user_budgets/1.json
  def show
  end

  # GET /user_budgets/new
  def new
    @user_budget = UserBudget.new
  end

  # GET /user_budgets/1/edit
  def edit
  end

  # POST /user_budgets
  # POST /user_budgets.json
  def create
    @user_budget = UserBudget.new(user_budget_params)

    respond_to do |format|
      if @user_budget.save
        format.html { redirect_to @user_budget, notice: 'User budget was successfully created.' }
        format.json { render :show, status: :created, location: @user_budget }
      else
        format.html { render :new }
        format.json { render json: @user_budget.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_budgets/1
  # PATCH/PUT /user_budgets/1.json
  def update
    respond_to do |format|
      if @user_budget.update(user_budget_params)
        format.html { redirect_to @user_budget, notice: 'User budget was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_budget }
      else
        format.html { render :edit }
        format.json { render json: @user_budget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_budgets/1
  # DELETE /user_budgets/1.json
  def destroy
    @user_budget.destroy
    respond_to do |format|
      format.html { redirect_to user_budgets_url, notice: 'User budget was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_budget
      @user_budget = UserBudget.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_budget_params
      params.require(:user_budget).permit(:user_id, :admin_id, :budget_num, :budget_note)
    end
end
