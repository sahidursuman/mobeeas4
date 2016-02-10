require 'test_helper'

class EngagementTokenPacksControllerTest < ActionController::TestCase
  setup do
    @engagement_token_pack = engagement_token_packs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:engagement_token_packs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create engagement_token_pack" do
    assert_difference('EngagementTokenPack.count') do
      post :create, engagement_token_pack: { member_price: @engagement_token_pack.member_price, name: @engagement_token_pack.name, number_of_tokens: @engagement_token_pack.number_of_tokens }
    end

    assert_redirected_to engagement_token_pack_path(assigns(:engagement_token_pack))
  end

  test "should show engagement_token_pack" do
    get :show, id: @engagement_token_pack
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @engagement_token_pack
    assert_response :success
  end

  test "should update engagement_token_pack" do
    patch :update, id: @engagement_token_pack, engagement_token_pack: { member_price: @engagement_token_pack.member_price, name: @engagement_token_pack.name, number_of_tokens: @engagement_token_pack.number_of_tokens }
    assert_redirected_to engagement_token_pack_path(assigns(:engagement_token_pack))
  end

  test "should destroy engagement_token_pack" do
    assert_difference('EngagementTokenPack.count', -1) do
      delete :destroy, id: @engagement_token_pack
    end

    assert_redirected_to engagement_token_packs_path
  end
end
