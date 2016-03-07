require 'test_helper'

class TokenPurchasesControllerTest < ActionController::TestCase
  setup do
    @token_purchase = token_purchases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:token_purchases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create token_purchase" do
    assert_difference('TokenPurchase.count') do
      post :create, token_purchase: { number_of_tokens: @token_purchase.number_of_tokens, organisation_id: @token_purchase.organisation_id, payment: @token_purchase.payment, user_id: @token_purchase.user_id }
    end

    assert_redirected_to token_purchase_path(assigns(:token_purchase))
  end

  test "should show token_purchase" do
    get :show, id: @token_purchase
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @token_purchase
    assert_response :success
  end

  test "should update token_purchase" do
    patch :update, id: @token_purchase, token_purchase: { number_of_tokens: @token_purchase.number_of_tokens, organisation_id: @token_purchase.organisation_id, payment: @token_purchase.payment, user_id: @token_purchase.user_id }
    assert_redirected_to token_purchase_path(assigns(:token_purchase))
  end

  test "should destroy token_purchase" do
    assert_difference('TokenPurchase.count', -1) do
      delete :destroy, id: @token_purchase
    end

    assert_redirected_to token_purchases_path
  end
end
