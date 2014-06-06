require File.expand_path("../../test_helper", __FILE__)

class UserControllerTest < ActionController::TestCase

	setup do
		session[:user_id] = 3
	end

   	test "the truth" do
    	assert true
   	end

   	test "shoud create a new simple user" do 
   		params = {
   			login: "rsouza",
   			name:  "rogesson",
   			cpf:   "129312873"
   		}

   		post(:create, params)
   		assert_equal(response.body, "$('#status')[0].innerHTML='<center>REGISTRO CRIADO COM SUCESSO!<center>'")
   	end
end
