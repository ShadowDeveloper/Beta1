require File.expand_path("../../test_helper", __FILE__)

class UsersControllerTest < ActionController::TestCase

	setup do
		session[:user_id] = 3
	end

	test "the truth" do
 	assert true
	end

	test "should create a new simple user" do 
		count = User.count
		params = {
			user: {
				login: "rsouza",
				name:  "rogesson",
				cpf:   "129312873"
			}
		}

		post(:create, params)
		assert_equal(User.count, count+1)
	end

	test "should create a new ADMIN user" do
		count = User.count
		params = {
			user:{
				login: "cbarboza",
				name:  "carlos barboza",
				cpf:   "121121211",
				admin: 1
			}
		}

		post(:create, params)
		assert_equal(User.count, count+1)
	end

	test "should not create user with duplicate cpf" do
		count = User.count
		params = {
			user:{
				login: "lsilva",
				name:  "lucas silva",
				cpf:   "#{User.first.cpf}",
				admin: 1
			}
		}
		post(:create, params)
		
		assert_equal(User.count, count)
	end

	test "should not create user with duplicate login" do
		count = User.count
		params = {
			user: {
				login: "#{User.first.login}",
				name:  "lucas silva",
				cpf:   "2112121222",
				admin: 1
			}
		}
		post(:create, params)
		
		assert_equal(User.count, count)
	end

	test "should not create user without name" do
		count = User.count
		params = {
			user: {
				login: "blalblala",
				cpf:   "2112121222",
				admin: 1
			}
		}
		post(:create, params)
		
		assert_equal(User.count, count)
	end
end
