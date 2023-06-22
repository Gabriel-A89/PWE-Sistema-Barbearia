<%@ page import="model.Usuario" %>
<%@ page import="database.DBQuery" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link href="../estilo/recSenha_confSenha.css" rel="stylesheet">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="shortcut icon" href="logo.jpg" />
        <title> BC Cadastro </title>
    </head>

    <body>
	    <%
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String pass = request.getParameter("pass");
			String confPass = request.getParameter("confPass"); 
			String telefone = request.getParameter("telefone");
			String cpf = request.getParameter("cpf");
			
			Usuario usuario = new Usuario(name, email, pass, telefone, cpf);
			//DBQuery dbQuery = new DBQuery("usuario", "nome, email, senha, telefone, cpf, foto, tipoIdUsuario", "idUsuario");
			
			usuario.save();
			
		%>
    	<div id="img">
        	<br>
        	<a style="text-decoration: none;"><img id="logo" src="../Imagens/bom_corte/logo.jpg" class="img-circle" Alt="logo" title="BomCorte"></a>
        </div>
        <div id="ajuste">
        	<div class="LogContainer">
            <div class="cad">
            	<%
            		if (usuario.getEmail() != null){
            			out.write("<label id='msgRec' aria-hidden='true'> Cadastro realizado com sucesso </label>");
            			out.write("<a href='conteudo/login.jsp'><img id='seta' src='../Imagens/seta/arrow.png' Alt='Seta para voltar' title='Seta para voltar'></a>");
            		}else {
            			out.write("<label id='msgRec' aria-hidden='true'> Falha ao realizar o Cadastro </label>");
            			out.write("<img id='seta' src='../Imagens/seta/arrow.png' onclick='history.go(-1)' Alt='Seta para voltar' title='Seta para voltar'>");
            		}
            	%>
            </div>

        </div>
        </div>
    </body>
</html>