require File.dirname(__FILE__) + '<%= '/..' * controller_class_nesting_depth %>/../test_helper'
require '<%= controller_file_path %>_controller'

# Re-raise errors caught by the controller.
class <%= controller_class_name %>Controller; def rescue_action(e) raise e end; end

class <%= controller_class_name %>ControllerTest < ActionController::TestCase
  setup do
    @@<%= file_name %> = Factory(:<%= file_name %>)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert assigns(:<%= table_name %>)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create <%= file_name %>" do
    assert_difference '<%= class_name %>.count' do
      post :create, :<%= file_name %> => { }
    end

    assert_redirected_to <%= file_name %>_path(assigns(:<%= file_name %>))
  end

  test "should show <%= file_name %>" do
    get :show, :id => @@<%= file_name %>.id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @@<%= file_name %>.id
    assert_response :success
  end

  test "should update <%= file_name %>" do
    put :update, :id => @@<%= file_name %>.id, :<%= file_name %> => { }
    assert_redirected_to <%= file_name %>_path(assigns(:<%= file_name %>))
  end

  test "should destroy <%= file_name %>" do
    assert_difference '<%= class_name %>.count', -1 do
      delete :destroy, :id => @@<%= file_name %>.id
    end

    assert_redirected_to <%= table_name %>_path
  end
end
