// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require underscore
//= require gmaps/google

//mascaras dos forms de input
function ProjectInputMasks(){
    // Clients masks
    $('#client_cpf').mask('000.000.000-00');
    $('#client_dob').mask('00/00/0000');
    $('#client_phone_number').mask('(00) 0000-0000');
    $('#client_phone_number2').mask('(00) 0000-0000');
    $('#client_mobile_number').mask('(00) 0000-00000');
    $('#client_reference_phone_number').mask('(00) 0000-0000');
    $('#client_reference_phone_number2').mask('(00) 0000-0000');
    $('#client_address').mask('00000-000');
    $('#company_income').mask('R$ 00000000');
    
    // Residence masks
    $('#residence_cep').mask('00000-000');
    $('#cpf').mask('000.000.000-00');
    $('#residence_info_sell_value, #residence_info_rent_value, #residence_info_condominium_value, #residence_info_iptu_value').mask('R$ 000000000000');

}

//Calculo de CEPs dos correios
function getCEPClients(cep){
    //cep fit 04042-070
    cep = cep.replace("-","");
    document.querySelector('#loadingImg').style.display="block";
    $.ajax({
      url: 'http://correiosapi.apphb.com/cep/'+cep,
      dataType: 'jsonp',
      crossDomain: true,
      contentType: "application/json",
      statusCode: {
        200: function(data){
              document.querySelector('#loadingImg').style.display="none";
              console.log(data);
              $("#city")[0].value = data["cidade"];
              $("#neigborhood")[0].value = data["bairro"];
              $("#street")[0].value = data["tipoDeLogradouro"] + " " + data["logradouro"];
        } // Ok
        ,400: function(msg) { console.log(msg);} // Bad Request
        ,404: function(msg) { console.log("CEP n?o encontrado!!");} // Not Found
      }
    });
}

function getCEPResidence(cep){
    //cep fit 04042-070
    cep = cep.replace("-","");
    document.querySelector('#loadingImg').style.display="block";
    $.ajax({
      url: 'http://correiosapi.apphb.com/cep/'+cep,
      dataType: 'jsonp',
      crossDomain: true,
      contentType: "application/json",
      statusCode: {
        200: function(data) {
              document.querySelector('#loadingImg').style.display="none";
              console.log(data);
              $("#residence_city")[0].value = data["cidade"];
              $("#residence_neighbourhood")[0].value = data["bairro"];
              $("#residence_street")[0].value = data["tipoDeLogradouro"] + " " + data["logradouro"];
              $("#residence_state")[0].value = data["estado"];
        } // Ok
        ,400: function(msg) { console.log(msg); document.querySelector('#loadingImg').style.display="none";} // Bad Request
        ,404: function(msg) { console.log("CEP n?o encontrado!!"); document.querySelector('#loadingImg').style.display="none";} // Not Found
      }
    });
}

//function para cadastro com sucesso
// function fnAlertUsers(msg){
//   $('body').append("<div id='myModal' class='reveal-modal small' data-reveal><p class='lead'>"+msg+"</p><a class='close-reveal-modal'>&#215;</a></div>");
//   $('#myModal').foundation('reveal', 'open');
//   setTimeout(function(){
//     window.location.href='/users/list';
//   }, 1300);
//   return;
// }

// //function para cadastro com sucesso
// function fnAlertClients(msg, code, url){
//   $('body').append("<div id='myModal' class='reveal-modal small' data-reveal><p class='lead'>"+msg+"</p><a class='close-reveal-modal'>&#215;</a></div>");
//   $('#myModal').foundation('reveal', 'open');
//   if (code == "200"){
//     setTimeout(function(){
//        window.location.href=""+url
//     }, 1300);    
//   }
//   return;
// }

//inserer os numeros dos passos de cadastro
function stepsCount(){
  var count = 1;
  $('.steps').each(function(){$(this).html(count);count++}); 
}


