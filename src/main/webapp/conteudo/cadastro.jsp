<%@ page import="model.Usuario" %>
<%@ page import="database.DBQuery" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException"%>
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
	    	String emailDb = "";
			String nome = request.getParameter("nome");
			String email = request.getParameter("email");
			String pass = request.getParameter("pass");
			String telefone = request.getParameter("telefone");
			String cpf = request.getParameter("cpf");
			String acao = request.getParameter("acao");
			
			Usuario usuario = new Usuario(nome, email, pass, telefone, cpf);
			//DBQuery dbQuery = new DBQuery("usuario", "nome, email, senha, telefone, cpf, foto, tipoIdUsuario", "idUsuario");
			DBQuery dbQuery = new DBQuery("usuario", "idUsuario, email", "idUsuario");
			ResultSet rs = dbQuery.select("email", email);
			try {
			    
			    while (rs.next()) {
			        int id = rs.getInt("idUsuario");
			        emailDb = rs.getString("email");
			    }
			    
			    rs.close();
			} catch (SQLException e) {
			    // Handle any potential exceptions here
			    e.printStackTrace();
			}
			if (emailDb.equals(email)){
				acao = "0";
			} else {
				usuario.saveCadastro();
			}
			
		%>
    	<div id="img">
        	<br>
        	<a style="text-decoration: none;"><img id="logo" src="../Imagens/bom_corte/logo.jpg" class="img-circle" Alt="logo" title="BomCorte"></a>
        </div>
        <div id="ajuste">
        	<div class="LogContainer">
	            <div class="cad">
	            	<%
	            		if (acao == "1"){
	            			out.write("<label id='msgRec' aria-hidden='true'> Cadastro realizado com sucesso </label>");
	            			out.write("<a href='login.jsp'><img id='seta' src='../Imagens/seta/arrow.png' Alt='Seta para voltar' title='Seta para voltar'></a>");
	            		}else {
	            			out.write("<label id='msgRec' aria-hidden='true'> Falha ao realizar o Cadastro </label>");
	            			out.write("<a href='login.jsp'><img id='seta' src='../Imagens/seta/arrow.png' onclick='history.go(-1)' Alt='Seta para voltar' title='Seta para voltar'></a>");
	            		}
	            	%>
	            </div>
        	</div>
        </div>
    </body>
</html>