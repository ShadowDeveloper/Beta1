function showOptionButton(id){
	$("#btn_group-residence-"+id).css("display","block")
}

function hideOptionButton(id){
	$("#btn_group-residence-"+id).css("display","none")
}

function scrollToMap(){
	$('html, body').animate({scrollTop:$('#sidebar_builder').offset().top}, 'slow');
}

//funcao de validacao de campos da busca de imovel
function validateFormSearchResidence(){
  console.log('validateFormSearchResidence')
 
  $('form').submit(
    function(){
      var form_ok = true

      if ( !validate($("#residence_type")) ){
        form_ok = false;
      }

      if ( !validate($("#residence_status")) ){
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

//funcao de validacao de campos da busca de imovel
function validateFormNewResidence(){
  console.log('validateFormNewResidence')
 
  $('form').submit(
    function(){
      var form_ok = true

      if ( !validate($("#residence_info_area_total")) ){
        form_ok = false;
      }

      if ( !validate($("#residence_info_qtd_garage")) ){
        form_ok = false;
      }

      if ( !validate($("#residence_info_qtd_banheiro")) ){
        form_ok = false;
      }

      if ( !validate($("#residence_info_qtd_suite")) ){
        form_ok = false;
      }

      if ( !validate($("#residence_info_qdt_domitorio")) ){
        form_ok = false;
      }

      if ( !validate($("#residence_info_condominium_value")) ){
        form_ok = false;
      }

      if ( !validate($("#residence_info_rent_value")) ){
        form_ok = false;
      }

      if ( !validate($("#residence_info_sell_value")) ){
        form_ok = false;
      }

      if ( !validate($("#residence_info_residence_code")) ){
        form_ok = false;
      }

      if ( !validate($("#residence_number")) ){
        form_ok = false;
      }


      if ( !validate($("#residence_cep")) ){
        form_ok = false;
      }

      if ( !validate($("#residence_residence_type")) ){
        form_ok = false;
      }

      if ( !validate($("#residence_status")) ){
        form_ok = false;
      }

      if ( !validate($("#cpf")) ){
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