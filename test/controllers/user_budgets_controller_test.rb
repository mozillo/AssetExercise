require 'test_helper'

class UserBudgetsControllerTest < ActionController::TestCase
  setup do
    @user_budget = user_budgets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_budgets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_budget" do
    assert_difference('UserBudget.count') do
      post :create, user_budget: { admin_id: @user_budget.admin_id, budget_note: @user_budget.budget_note, budget_num: @user_budget.budget_num, user_id: @user_budget.user_id }
    end

    assert_redirected_to user_budget_path(assigns(:user_budget))
  end

  test "should show user_budget" do
    get :show, id: @user_budget
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_budget
    assert_response :success
  end

  test "should update user_budget" do
    patch :update, id: @user_budget, user_budget: { admin_id: @user_budget.admin_id, budget_note: @user_budget.budget_note, budget_num: @user_budget.budget_num, user_id: @user_budget.user_id }
    assert_redirected_to user_budget_path(assigns(:user_budget))
  end

  test "should destroy user_budget" do
    assert_difference('UserBudget.count', -1) do
      delete :destroy, id: @user_budget
    end

    assert_redirected_to user_budgets_path
  end
end
