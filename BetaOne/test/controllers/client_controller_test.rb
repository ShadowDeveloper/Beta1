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

    #client_params

      name:           "rogesson",
      rg:             "12312312",
      dob:            "12/11/1022",
      cpf:            "1221121",
      relationship:   1,
      address:        "1212221",
      phone_number:   "1212121",
      phone_number2:  "1212121",
      email_address:  "1212121",
      email_address2: "1212121",
      mobile_number:  "1212121",
      mobile_number2: "1212121",
      client_type:    1,
    #company_params
     
      income:       1000.20,
      extra_income: 123.32,
      ocupation:    "caixa" ,
      company_name: "MCdonalds",
    #client_references_params

      name:          "adriano",
      phone_number:  "12212121",
      phone_number2: "12019211",
    #bank_account_params
      bank_id:        1,
      agency:         "1219291",
      account_number: "01921"
    }
    post(:create, params)
    puts response.body
  end
end