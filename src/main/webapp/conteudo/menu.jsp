<ul id="ulMenu">
	<div class="login">
    	<%
    	   String userId = (String) session.getAttribute("userId");
    	   if (userId == null){
    		   out.write("<a id='log' href='conteudo/login.jsp'><img src='Imagens/menu/login.png' id='login' class='img-circle'><br><p>Login</p></a>");
    	   }else{
    		   out.write("<a id='log' href='conteudo/perfil.jsp'><img src='Imagens/menu/user.png' id='user' class='img-circle' /><br><p>Perfil</p></a>");
    	   }
    	%>
    </div>

    <li> <a href="#" onclick="$('#body').load('conteudo/body.html');">          Home 		</a> </li>
    <li> <a href="#" onclick="$('#body').load('conteudo/sobre.html');"> 		Sobre     	</a> </li>
    <li> <a href="#" onclick="$('#body').load('conteudo/produtos.html');">  	Produtos  	</a> </li>

    <img id="logoMenu" src="Imagens/bom_corte/logo.jpg" class="img-circle"  title="BomCorte" />
  
    <li> <a href="conteudo/agendamento.jsp" >  		Agendamento     	</a> </li>
    <li> <a href="#" onclick="$('#body').load('conteudo/cortes.html');">  		Cortes     	</a> </li>
    <li> <a href="#" onclick="$('#body').load('conteudo/contato.html');">  		Contato    	</a> </li>
</ul>