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