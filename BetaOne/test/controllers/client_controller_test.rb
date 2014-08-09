require File.expand_path("../../test_helper", __FILE__)

class ClientControllerTest < ActionController::TestCase
	setup do
		session[:user_id] = 3
	end

	test "the truth" do
  		assert true
  end

  test "should create a new client" do
    params = {
      "utf8"=>"x",
      "authenticity_token"=>"lFyhlmZ8Sb2Lve9lyslEuaGVQQhEFbHWUua+pO+QYxA=",
      "client"=>{
        "name"=>"rogesson barboza",
        "rg"=>"19208333",
        "dob"=>"12/11/1992",
        "cpf"=>"192.123.422.12",
        "relationship"=>"solteiro",
        "address"=>"R. do sapo",
        "phone_number"=>"(11) 2938-2934)",
        "phone_number2"=>"(11) 2938-2934)",
        "email_address"=>"rogesson@gmail.com",
        "email_address2"=>"rogesson@gmail.com",
        "mobile_number"=>"(11) 98991-1929)",
        "mobile_number2"=>"(11) 98991-1929)",
        "client_type"=>"1"
      },
      "company"=>{
        "income"=>"1092,00",
        "ocupation"=>"Professor",
        "company_name"=>"Escola da Vida"
      },
      "client_reference"=>{
        "name"=>"Guimerme",
        "phone_number"=>"(11) 2938-2934",
        "phone_number2"=>"(11) 2938-2934"
      },
      "bank_account"=>{
        "bank_id"=>"1",
        "agency"=>"109",
        "account_number"=>"1991923"
      },
      "commit"=>"Create Client"
    }

    count_client = Client.count
    post(:create, params)
    assert_not_equal count_client, Client.count 
  end

  test "should get a client" do
    get(:show, id: Client.first.id)
    assert_equal @response.code, "200"
  end

end