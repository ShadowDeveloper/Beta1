//funcao de validacao de campos da busca de cliente
function validateFormSearchClient(){
  console.log('validateFormSearchClient')
 
  $('form').submit(
    function(){
      var form_ok = true

      if ( !validate($("#search_by")) ){
        form_ok = false;
      }

      if ( !validate($("#search")) ){
        form_ok = false;
      }
      if (form_ok){
        true;
      } else {
        event.preventDefault();
        fnDefaultMessage('Preecha todos os campos obrigatórios')
      }
    }
  );  
}


//funcao de validacao de campos da cadastro de cliente
function validateFormNewClient(){
  console.log('validateFormNewClient')
 
  $('form').submit(
    function(){
      var form_ok = true
      
      if ( !validate($("#client_name")) ){
        form_ok = false;
      }

      if ( !validate($("#client_rg")) ){
        form_ok = false;
      }


      if ( !validate($("#client_dob")) ){
        form_ok = false;
      }

      if ( !validate($("#client_cpf")) ){
        form_ok = false;
      }

      if ( !validate($("#client_relationship")) ){
        form_ok = false;
      }

      if ( !validate($("#client_email_address")) ){
        form_ok = false;
      }

      if ( !validate($("#client_phone_number")) ){
        form_ok = false;
      }

      if ( !validate($("#bank_account_bank_id")) ){
        form_ok = false;
      }

      if ( !validate($("#bank_account_agency")) ){
        form_ok = false;
      }

      if ( !validate($("#bank_account_account_number")) ){
        form_ok = false;
      }

      if ( !validate($("#client_address")) ){
        form_ok = false;
      }

      if ( !validate($("#company_income")) ){
        form_ok = false;
      }

      if ( !validate($("#company_company_name")) ){
        form_ok = false;
      }
    
      if ( !validate($("#street_n")) ){
        form_ok = false;
      }

      
      if ( !validate($("#company_ocupation")) ){
        form_ok = false;
      }
      
      if (form_ok){
        true;
      } else {
        event.preventDefault();
        fnDefaultMessage('Preecha todos os campos obrigatórios')
      }
    }
  );  
}