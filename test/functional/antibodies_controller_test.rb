require 'test_helper'

class AntibodiesControllerTest < ActionController::TestCase
  setup do
    @antibody = antibodies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:antibodies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create antibody" do
    assert_difference('Antibody.count') do
      post :create, :antibody => @antibody.attributes
    end

    assert_redirected_to antibody_path(assigns(:antibody))
  end

  test "should show antibody" do
    get :show, :id => @antibody.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @antibody.to_param
    assert_response :success
  end

  test "should update antibody" do
    put :update, :id => @antibody.to_param, :antibody => @antibody.attributes
    assert_redirected_to antibody_path(assigns(:antibody))
  end

  test "should destroy antibody" do
    assert_difference('Antibody.count', -1) do
      delete :destroy, :id => @antibody.to_param
    end

    assert_redirected_to antibodies_path
  end
end
