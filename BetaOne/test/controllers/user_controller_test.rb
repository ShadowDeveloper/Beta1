require File.expand_path("../../test_helper", __FILE__)

class UserControllerTest < ActionController::TestCase

	setup do
		session[:user_id] = 3
	end

   	test "the truth" do
    	assert true
   	end


end
