function showOptionButton(id){
	$("#btn_group-residence-"+id).css("display","block")
}

function hideOptionButton(id){
	$("#btn_group-residence-"+id).css("display","none")
}

function scrollToMap(){
	$('html, body').animate({scrollTop:$('#sidebar_builder').offset().top}, 'slow');
}