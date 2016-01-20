require 'test_helper'

class AssetManagesControllerTest < ActionController::TestCase
  setup do
    @asset_manage = asset_manages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:asset_manages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create asset_manage" do
    assert_difference('AssetManage.count') do
      post :create, asset_manage: { brand: @asset_manage.brand, category: @asset_manage.category, model: @asset_manage.model, owner_id: @asset_manage.owner_id, price: @asset_manage.price, producer: @asset_manage.producer, product: @asset_manage.product, qty: @asset_manage.qty, remarks: @asset_manage.remarks, seq: @asset_manage.seq, stock_in_number: @asset_manage.stock_in_number, stock_out_number: @asset_manage.stock_out_number, unit: @asset_manage.unit }
    end

    assert_redirected_to asset_manage_path(assigns(:asset_manage))
  end

  test "should show asset_manage" do
    get :show, id: @asset_manage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @asset_manage
    assert_response :success
  end

  test "should update asset_manage" do
    patch :update, id: @asset_manage, asset_manage: { brand: @asset_manage.brand, category: @asset_manage.category, model: @asset_manage.model, owner_id: @asset_manage.owner_id, price: @asset_manage.price, producer: @asset_manage.producer, product: @asset_manage.product, qty: @asset_manage.qty, remarks: @asset_manage.remarks, seq: @asset_manage.seq, stock_in_number: @asset_manage.stock_in_number, stock_out_number: @asset_manage.stock_out_number, unit: @asset_manage.unit }
    assert_redirected_to asset_manage_path(assigns(:asset_manage))
  end

  test "should destroy asset_manage" do
    assert_difference('AssetManage.count', -1) do
      delete :destroy, id: @asset_manage
    end

    assert_redirected_to asset_manages_path
  end
end
