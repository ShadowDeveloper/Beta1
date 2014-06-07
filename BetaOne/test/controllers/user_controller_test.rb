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
			cpf:   "121121211",
			admin: 1
		}

		post(:create, params)
		assert_equal(response.body, "$('#status')[0].innerHTML='<center>REGISTRO CRIADO COM SUCESSO!<center>'")
	end

	test "should not create user with duplicate cpf" do
		params = {
			login: "lsilva",
			name:  "lucas silva",
			cpf:   "#{User.first.cpf}",
			admin: 1
		}
		post(:create, params)
		
		assert_not_equal(response.body, "$('#status')[0].innerHTML='<center>REGISTRO CRIADO COM SUCESSO!<center>'")
		
	end

		
	test "should not create user with duplicate login" do
		params = {
			login: "#{User.first.login}",
			name:  "lucas silva",
			cpf:   "2112121222",
			admin: 1
		}
		post(:create, params)
		
		assert_not_equal(response.body, "$('#status')[0].innerHTML='<center>REGISTRO CRIADO COM SUCESSO!<center>'")
	end
end
