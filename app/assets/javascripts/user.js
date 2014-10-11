function createUser(status, msg, id){
	if (status == 200){
		fnDefaultMessage("Cadastro efetuado com sucesso!");
		window.location.href = "/users/" + id
	} else {
		fnDefaultMessage(msg);
	}
		
}