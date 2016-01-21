require 'test_helper'

class GsControllerTest < ActionController::TestCase
  setup do
    @g = gs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create g" do
    assert_difference('G.count') do
      post :create, g: { admin_id: @g.admin_id, budget_note: @g.budget_note, budget_num: @g.budget_num, user_budget: @g.user_budget, user_id: @g.user_id }
    end

    assert_redirected_to g_path(assigns(:g))
  end

  test "should show g" do
    get :show, id: @g
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @g
    assert_response :success
  end

  test "should update g" do
    patch :update, id: @g, g: { admin_id: @g.admin_id, budget_note: @g.budget_note, budget_num: @g.budget_num, user_budget: @g.user_budget, user_id: @g.user_id }
    assert_redirected_to g_path(assigns(:g))
  end

  test "should destroy g" do
    assert_difference('G.count', -1) do
      delete :destroy, id: @g
    end

    assert_redirected_to gs_path
  end
end
