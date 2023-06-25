<%@ page import="model.Usuario" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link href="../estilo/login.css" rel="stylesheet">
        <link rel="shortcut icon" type="x-icon" href="../Imagens/bom_corte/logo.jpg" />
        <title>BC Login</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>
	<body>
		<div id="img">
        	<br>
        	<a style="text-decoration: none;" href="../">
        		<img id="logo" src="../Imagens/bom_corte/logo.jpg" class="img-circle" Alt="logo" title="BomCorte">
        	</a>
        </div>
        <div id="ajuste">
        	<div class="LogContainer">
	            <input type="checkbox" id="chk" aria-hidden="true">
	            <div class="cad">
					<form name="cadastro" id="formCad" method="GET" action="getcadastrocliente" enctype="multipart/form-data">
	                	<label id="sta" for="chk" aria-hidden="true">Cadastre-se</label>
	                	<div id="roll">
	                    	<input id="txtNome" type="text" name="nome" required placeholder="Nome Completo" > 
	                    	<input id="txtEmail" type="Email" name="email" required placeholder="Email"> 
	                    	<input id="txtPass" type="password" name="pass" required placeholder="Senha"> 
	                    	<input id="txtConfPass" type="password" name="confPass" required placeholder="Confirme a senha"> 
	                    	<input id="txtTelefone" type="tel" name="telefone" maxlength='14' required placeholder="+9999999999999">
	                    	<p style="color: #FFAA00;"><small>Formato Exemplo: +5511999999999</small></p>
	                    	<input id="txtCpf" type="text" name="cpf" maxlength='11' required placeholder="CPF">
	                    	<p style="color: #FFAA00;"><small>Escreva o CPF tudo junto</small></p> 
	                    	<!-- <label id="men">Adicione uma foto &#128513; </label>
	                    		<input type="file" name="foto" class="form-control-file" id="exampleFormControlFile1">
	                    		<input id="butCad" type="submit" onclick="acao.value='1'; this.form.submit();" value="Cadastrar">  
	                    	-->
	                    	<input type="hidden" name="acao" value="0">
	                    	<button id="butCad" type="button" onclick="validarCadastro()">Cadastrar</button> 
	                	</div>
	                </form>
	            </div>
	            <div class="login">
	                <form name="login" id="formLogin" method="post" action="">
	                    <label for="chk" aria-hidden="true"> Login</label>
	                    <input type="text" name="email" required placeholder="Email"> 
	                    <input type="password" name="pass" required placeholder="Senha"> 
	                    <input id="butLogin" type="button" value="Iniciar Sessão"> 
	                </form>
	            </div>
        	</div>
        </div>
	</body>
	<script type="text/javascript">
		var erroFormulario = 0;
		var nome = "";
		var email = "";
		var pass = "";
		var confPass = "";
		var telefone = "";
		var cpf = "";
		
		var regexEmail = /^(([^<>()[]\.,;:\s@"]+(.[^<>()[]\.,;:\s@"]+)*)|(".+"))@(([[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}])|(([a-zA-Z-0-9]+.)+[a-zA-Z]{2,}))$/;
		
		function validarCadastro(){
	
	        nome  = $("#txtNome").val();
	        email = $("#txtEmail").val();
	        pass  = $("#txtPass").val();
	        confPass  = $("#txtConfPass").val();
	        telefone  = $("#txtTelefone").val();
	        cpf  = $("#txtCpf").val();

			if (nome.length < 3) {
				erroFormulario = 1;
				console.log("nome");
			}
			
			if (pass.length < 3) {
				erroFormulario = 1;
				console.log("pass");
			}
			
			if (confPass.length < 3) {
				erroFormulario = 1;
				console.log("confpass");
			}
			
			if (telefone.length != 14) {
				erroFormulario = 1;
				console.log("telefone");
			}
			
			if (cpf.length != 11) {
				erroFormulario = 1;
				console.log("cpf");
			}
			
			//if (!(regexEmail.test(txtEmail.value))) {

	        //    erroFormulario = 1;
	        //    console.log("email");

	        //}
			
			if (erroFormulario == 0) {
	            location.href = "getcadastrocliente?nome="+nome+"&email="+email+"&pass="+pass+"&telefone="+telefone+"&cpf="+cpf;
	            console.log("Validação OK");
			} else {
				erroFormulario = 0;
			}
	    }
	</script>
</html>