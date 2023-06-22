<div class="PgAgenda">

    <h1 class="titulo" style="margin-left:30%;margin-right:30%;">Venha Agendar seu Corte</h1>

	<img src="Imagens/agendamento/maquina.jpg" width="100px" height="100px" style="border-radius: 30%;">
	<img src="Imagens/agendamento/tesoura.jpg" width="100px" height="100px" style="border-radius: 30%;">
	<img src="Imagens/agendamento/navalha.jpg" width="100px" height="100px" style="border-radius: 30%;">
	<br>

	<%
   	   String userId = (String) session.getAttribute("userId");
   	   if (userId == null){
   		   out.write("<a href='conteudo/login.php' id='btn2'>Agendar</a>");
   	   }else{
   		   out.write("<a onclick='$('#body').load('conteudo/agendamento2.php');' id='btn2'>Agendar</a>");
   	   }
    %>
</div>