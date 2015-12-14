require 'test_helper'

class SponsorsControllerTest < ActionController::TestCase
  setup do
    @sponsor = sponsors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sponsors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sponsor" do
    assert_difference('Sponsor.count') do
      post :create, sponsor: { address: @sponsor.address, country: @sponsor.country, first_name: @sponsor.first_name, guid: @sponsor.guid, last_name: @sponsor.last_name, organisation: @sponsor.organisation, phone1: @sponsor.phone1, phone2: @sponsor.phone2, position: @sponsor.position, postcode: @sponsor.postcode, state: @sponsor.state, suburb: @sponsor.suburb, user_id: @sponsor.user_id }
    end

    assert_redirected_to sponsor_path(assigns(:sponsor))
  end

  test "should show sponsor" do
    get :show, id: @sponsor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sponsor
    assert_response :success
  end

  test "should update sponsor" do
    patch :update, id: @sponsor, sponsor: { address: @sponsor.address, country: @sponsor.country, first_name: @sponsor.first_name, guid: @sponsor.guid, last_name: @sponsor.last_name, organisation: @sponsor.organisation, phone1: @sponsor.phone1, phone2: @sponsor.phone2, position: @sponsor.position, postcode: @sponsor.postcode, state: @sponsor.state, suburb: @sponsor.suburb, user_id: @sponsor.user_id }
    assert_redirected_to sponsor_path(assigns(:sponsor))
  end

  test "should destroy sponsor" do
    assert_difference('Sponsor.count', -1) do
      delete :destroy, id: @sponsor
    end

    assert_redirected_to sponsors_path
  end
end
