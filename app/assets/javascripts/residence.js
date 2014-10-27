function showOptionButton(id){
	$("#btn_group-residence-"+id).css("display","block")
}

function hideOptionButton(id){
	$("#btn_group-residence-"+id).css("display","none")
}

function scrollToMap(){
	$('html, body').animate({scrollTop:$('#sidebar_builder').offset().top}, 'slow');
}

//funcao de validacao de campos do 
function validateFormSearch(){
  console.log('listening')
 
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