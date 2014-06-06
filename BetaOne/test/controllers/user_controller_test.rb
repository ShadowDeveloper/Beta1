require File.expand_path("../../test_helper", __FILE__)

class UserControllerTest < ActionController::TestCase

	setup do
		session[:user_id] = 3
	end

   	test "the truth" do
    	assert true
   	end

   	test "should create a new simple user" do 
   		params = {
   			login: "rsouza",
   			name:  "rogesson",
   			cpf:   "129312873"
   		}

   		post(:create, params)
   		assert_equal(response.body, "$('#status')[0].innerHTML='<center>REGISTRO CRIADO COM SUCESSO!<center>'")
   	end

   	test "should create a new ADMIN user" do 
   		params = {
   			login: "cbarboza",
   			name:  "carlos barboza",
   			cpf:   "129312873",
   			admin: 1
   		}

   		post(:create, params)
   		assert_equal(response.body, "$('#status')[0].innerHTML='<center>REGISTRO CRIADO COM SUCESSO!<center>'")
   	end

   	test "should not create user with duplicate cpf" do

   		params1 = {
   			login: "lsilva",
   			name:  "lucas silva",
   			cpf:   "129312873",
   			admin: 1
   		}
   		post(:create, params1)

   		params2 = {
   			login: "rcarlos",
   			name:  "lucas silva",
   			cpf:   "129312873",
   			admin: 1
   		}
   		post(:create, params1)
   		
   		assert_equal User.count, 6
   		
   	end

   		
   	test "should not create user with duplicate login" do

   		params1 = {
   			login: "rcarlos",
   			name:  "lucas silva",
   			cpf:   "221231222",
   			admin: 1
   		}
   		post(:create, params1)

   		params2 = {
   			login: "rcarlos",
   			name:  "lucas silva",
   			cpf:   "129312873",
   			admin: 1
   		}
   		post(:create, params1)
   		
   		assert_equal User.count, 6
   		
   	end
end
