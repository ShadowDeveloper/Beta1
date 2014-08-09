require File.expand_path("../../test_helper", __FILE__)

class ClientControllerTest < ActionController::TestCase
	setup do
		session[:user_id] = 3
	end

	test "the truth" do
  		assert true
  end

  test "should get a client" do
  	get(:show, id: 4)
  	assert_equal @response.code, "200"
  end

  test "should create a new client" do
    params = {
      "utf8"=>"x",
      "authenticity_token"=>"lFyhlmZ8Sb2Lve9lyslEuaGVQQhEFbHWUua+pO+QYxA=",
      "client"=>{"name"=>"aopksd",
      "rg"=>"paoskd",
      "dob"=>"poaskd",
      "cpf"=>"opsda",
      "relationship"=>"sapodk",
      "address"=>"sapdok",
      "phone_number"=>"aspodk",
      "phone_number2"=>"aspodk",
      "email_address"=>"aspdok",
      "email_address2"=>"asdop",
      "mobile_number"=>"aspdok",
      "mobile_number2"=>"asdopk",
      "client_type"=>"1"},
      "company"=>{"income"=>"asokd",
      "ocupation"=>"asdopk",
      "company_name"=>"saodk"},
      "client_reference"=>{"name"=>"asdopk",
      "phone_number"=>"asdpok",
      "phone_number2"=>"oaksd"},
      "bank_account"=>{"bank_id"=>"asodk",
      "agency"=>"aspodk",
      "account_number"=>"aposkd"},
      "commit"=>"Create Client"
    }

    count_client = Client.count
    post(:create, params)
    assert_not_equal count_client, Client.count 

  end
end