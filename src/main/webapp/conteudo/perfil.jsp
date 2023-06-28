<%@ page import="model.Usuario" %>
<%@ page import="database.DBQuery" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%
	String userId = ""+session.getAttribute("userId");
    session.setAttribute("userId", userId);
    
	DBQuery dbQuery = new DBQuery("usuario", "idUsuario, nome, email, telefone, cpf, foto", "idUsuario");
	ResultSet rs = dbQuery.selectPerfil("idUsuario, nome, email, telefone, cpf. foto", 5);
	
	Usuario usuario = new Usuario();
	
	try {
	    while (rs.next()) {
	        usuario.setNome(rs.getString("nome"));
	        usuario.setEmail(rs.getString("email"));
	        usuario.setTelefone(rs.getString("telefone"));
	        usuario.setCpf(rs.getString("cpf"));
	        usuario.setFoto(rs.getString("foto"));
	    }
	    
	    rs.close();
	} catch (SQLException e) {
	    // Handle any potential exceptions here
	    e.printStackTrace();
	}
    
%>

<div id="perfil">
	<div id="img">
		<img id="imgPerfil" src="Imagens/menu/user.png" class="img-circle" Alt="logo" title="BomCorte">
	</div>
	<br><br>
	<div id="infoPerfil">
		<h3>
    
		</h3>
		<br>
		<div id="ajust">
			<div id="linkPerf">
    			<a style="display: inline-block;" href="#" onclick="$('#ajust').load('conteudo/perfilAlt.php');"> <img src="../Imagens/opc/gear.png" class="img-circle" Alt="alterar" title="Alterar"> <br> <p> Alterar </p> </a>
        		<br>
        		
                            <a style="display: inline-block; width: 48px;" href="conteudo/adm.jsp"> 
                            	<img src="../Imagens/opc/file.png" class="img-circle" Alt="adm" title="Adm"> 
                            	<br> 
                            	<p> ADM </p> 
                            </a>
               	
			</div>
            <div id="infoAlt">
                <br>
               	<h4 class="titulo">Nome:</h4> 			<p> <%=usuario.getNome() %> </p>
                <br>
                <h4 class="titulo">Telefone:</h4> 		<p> <%=usuario.getTelefone() %></p>
                <br>
                <h4 class="titulo">CPF:</h4> 			<p> <%=usuario.getCpf() %></p>
            	<br>
            </div>
            <br>
            
            <form name="sair" id="formSair" method="post" action="Sair">
            	<button id="butSair" type="button" onclick="this.form.submit()">Sair</button> 
            </form>
            
		</div>
	</div>
	
</div>
         