require File.expand_path("../../test_helper", __FILE__)

class ClientControllerTest < ActionController::TestCase
	setup do
		session[:user_id] = 3
	end

	test "the truth" do
  		assert true
  end

  test "should get a user" do
  	get(:show, id: 4)
  	assert_equal @response.code, "200"
  end
end