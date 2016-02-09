require 'test_helper'

class SubscriptionPacksControllerTest < ActionController::TestCase
  setup do
    @subscription_pack = subscription_packs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subscription_packs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subscription_pack" do
    assert_difference('SubscriptionPack.count') do
      post :create, subscription_pack: { name: @subscription_pack.name, price: @subscription_pack.price }
    end

    assert_redirected_to subscription_pack_path(assigns(:subscription_pack))
  end

  test "should show subscription_pack" do
    get :show, id: @subscription_pack
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subscription_pack
    assert_response :success
  end

  test "should update subscription_pack" do
    patch :update, id: @subscription_pack, subscription_pack: { name: @subscription_pack.name, price: @subscription_pack.price }
    assert_redirected_to subscription_pack_path(assigns(:subscription_pack))
  end

  test "should destroy subscription_pack" do
    assert_difference('SubscriptionPack.count', -1) do
      delete :destroy, id: @subscription_pack
    end

    assert_redirected_to subscription_packs_path
  end
end
