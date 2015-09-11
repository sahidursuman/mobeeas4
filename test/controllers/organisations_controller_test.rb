require 'test_helper'

class OrganisationsControllerTest < ActionController::TestCase
  setup do
    @organisation = organisations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:organisations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create organisation" do
    assert_difference('Organisation.count') do
      post :create, organisation: { acara_school_id: @organisation.acara_school_id, address: @organisation.address, contact_email: @organisation.contact_email, contact_name: @organisation.contact_name, contact_phone: @organisation.contact_phone, country: @organisation.country, latitude: @organisation.latitude, logo: @organisation.logo, longitude: @organisation.longitude, name: @organisation.name, organisation_type_id: @organisation.organisation_type_id, postcode: @organisation.postcode, school_type: @organisation.school_type, state: @organisation.state, suburb: @organisation.suburb, website: @organisation.website }
    end

    assert_redirected_to organisation_path(assigns(:organisation))
  end

  test "should show organisation" do
    get :show, id: @organisation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @organisation
    assert_response :success
  end

  test "should update organisation" do
    patch :update, id: @organisation, organisation: { acara_school_id: @organisation.acara_school_id, address: @organisation.address, contact_email: @organisation.contact_email, contact_name: @organisation.contact_name, contact_phone: @organisation.contact_phone, country: @organisation.country, latitude: @organisation.latitude, logo: @organisation.logo, longitude: @organisation.longitude, name: @organisation.name, organisation_type_id: @organisation.organisation_type_id, postcode: @organisation.postcode, school_type: @organisation.school_type, state: @organisation.state, suburb: @organisation.suburb, website: @organisation.website }
    assert_redirected_to organisation_path(assigns(:organisation))
  end

  test "should destroy organisation" do
    assert_difference('Organisation.count', -1) do
      delete :destroy, id: @organisation
    end

    assert_redirected_to organisations_path
  end
end
