function createUser(status, msg, id){
	fnDefaultMessage(msg);
	if (status == '200'){
		window.location.href = "/users/" + id
	}		
}