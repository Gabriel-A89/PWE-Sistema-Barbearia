<%@ page import="model.Usuario" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link href="recSenha_confSenha.css" rel="stylesheet">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="shortcut icon" href="logo.jpg" />
        <title> BC Login </title>
    </head>

    <body>
    	<div id="img">
        	<br>
        	<a style="text-decoration: none;"><img id="logo" src="logo.jpg" class="img-circle" Alt="logo" title="BomCorte"></a>
        </div>
        <div id="ajuste">
        	<div class="LogContainer">
            <div class="cad">
            	<%
	    			String email = request.getParameter("email");
	    			String pass = request.getParameter("pass");
	            	Usuario usuario = new Usuario(email, senha);
	            	
	            	String userId = (String) session.getAttribute("userId");
	            	if (usuario.checkLogin()){
	            	    if(userId == null) {
	            	    	session.setAttribute("userId", );
		                    out.print("<label id='msgRec' aria-hidden='true'> Login realizado com sucesso </label>");
		                    out.print("<a href='conteudo/login.jsp'><img id='seta' src='../Imagens/seta/arrow.png' Alt='Seta para voltar' title='Seta para voltar'></a>");
	            	    }
	            	}else {
	            		out.print("<label id='msgRec' aria-hidden='true'> Falha ao realizar o Login </label>");
	            		out.print("<img id='seta' src='../Imagens/seta/arrow.png' onclick='history.go(-1)' Alt='Seta para voltar' title='Seta para voltar'>");
	            	}
                %>
            </div>s
        </div>
        </div>
    </body>
</html>