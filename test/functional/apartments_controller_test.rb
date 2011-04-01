require 'test_helper'

class ApartmentsControllerTest < ActionController::TestCase
  setup do
    @apartment = apartments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:apartments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create apartment" do
    assert_difference('Apartment.count') do
      post :create, :apartment => @apartment.attributes
    end

    assert_redirected_to apartment_path(assigns(:apartment))
  end

  test "should show apartment" do
    get :show, :id => @apartment.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @apartment.to_param
    assert_response :success
  end

  test "should update apartment" do
    put :update, :id => @apartment.to_param, :apartment => @apartment.attributes
    assert_redirected_to apartment_path(assigns(:apartment))
  end

  test "should destroy apartment" do
    assert_difference('Apartment.count', -1) do
      delete :destroy, :id => @apartment.to_param
    end

    assert_redirected_to apartments_path
  end
end
