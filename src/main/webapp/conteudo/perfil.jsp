


<%@ page import="model.Usuario" %>


<%


	String idUsuario = request.getParameter("idUsuario");
	String acao = request.getParameter("acao");

   	if (acao.equals("1")){
    	session.setAttribute("userId", idUsuario);
        
   	}else {
   		response.sendRedirect("index.jsp");
   	}
%>

<div id="perfil">
	<div id="img">
		<img id="imgPerfil" src="../Imagens/menu/user.png" class="img-circle" Alt="logo" title="BomCorte">
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
               	<h4 class="titulo">Nome:</h4> 			<p> > </p>
                <br>
                <h4 class="titulo">Telefone:</h4> 		<p> </p>
                <br>
                <h4 class="titulo">CPF:</h4> 			<p> </p>
            	<br>
            </div>
            <br>
            
            <form name="sair" id="formSair" method="post" action="Sair">
            	<button id="butSair" type="button" onclick="this.form.submit()">Sair</button> 
            </form>
            
		</div>
	</div>
	
</div>
         