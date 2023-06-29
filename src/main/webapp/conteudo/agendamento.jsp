<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userId = ""+session.getAttribute("userId");
    session.setAttribute("userId", userId);
%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link href="../estilo/css.css" rel="stylesheet">
        <link rel="shortcut icon" type="x-icon" href="../Imagens/bom_corte/logo.jpg" />
        <title>BC Login</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
   
    </head>
     <script type="text/javascript">

        function carregar() {
            $('#menu').load( 'conteudo/menu.jsp' );
            $('#logo').load( 'conteudo/logo.html' );
            $('#body').load( 'conteudo/body.html' );
            $('#footer').load( 'conteudo/footer.html' );
        }

        $(document).ready(function(){

            $(window).scroll(function(){
                if ($(this).scrollTop() > 100) {
                    $('a[href="#top"]').fadeIn();
                } else {
                    $('a[href="#top"]').fadeOut();
                }
            });

            $('a[href="#top"]').click(function(){
                $('html, body').animate({scrollTop : 0}, 'slow');
                return false;
            });
			
        });

    </script>
	<body> 
		<div id="menu">
			<ul id="ulMenu">
				<div class="login">
			    	<%
			    	   if (userId == null){
			    		   out.write("<a id='log' href='conteudo/login.jsp'><img src='../Imagens/menu/login.png' id='login' class='img-circle'><br><p>Login</p></a>");
			    	   }else{
			    		   out.write("<a id='log' href='perfil.jsp'><img src='../Imagens/menu/user.png' id='user' class='img-circle' /><br><p>Perfil</p></a>");
			    	   }
			    	%>
			    </div>
			
			    <li> <a href="#" onclick="$('#body').load('conteudo/body.html');">          Home 		</a> </li>
			    <li> <a href="#" onclick="$('#body').load('conteudo/sobre.html');"> 		Sobre     	</a> </li>
			    <li> <a href="#" onclick="$('#body').load('conteudo/produtos.html');">  	Produtos  	</a> </li>
			
			    <img id="logoMenu" src="../Imagens/bom_corte/logo.jpg" class="img-circle"  title="BomCorte" />
			  
			    <li> <a href="conteudo/agendamento.jsp" >  		Agendamento     	</a> </li>
			    <li> <a href="#" onclick="$('#body').load('conteudo/cortes.html');">  		Cortes     	</a> </li>
			    <li> <a href="#" onclick="$('#body').load('conteudo/contato.html');">  		Contato    	</a> </li>
			</ul>
		</div>
        <div id="logo"><img id="logoBC" src="../Imagens/bom_corte/logo2.jpeg"/></div>
		<div class="PgAgenda">
		
		    <h1 class="titulo" style="margin-left:30%;margin-right:30%;">Venha Agendar seu Corte</h1>
		
			<img src="../Imagens/agendamento/maquina.jpg" width="100px" height="100px" style="border-radius: 30%;">
			<img src="../Imagens/agendamento/tesoura.jpg" width="100px" height="100px" style="border-radius: 30%;">
			<img src="../Imagens/agendamento/navalha.jpg" width="100px" height="100px" style="border-radius: 30%;">
			<br>
		
			
		   	   <a href='login.jsp' id='btn2'>Agendar</a>
		   	  
		</div>
		 <div id="footer">
        	<div id="foot">
			    <footer>
			        <div class="fcontainer">
			            <div class="sec aboutus">
			                <h2>Sobre nós </h2>
			                <p>
			                    Bom Corte, a barbearia. <br>
			                    Somos uma Barbearia de excelência e<br>
			                    dedicação, composta por 7 integrantes <br>
			                    que buscam melhor atendê-lo</p>
			                    <ul class="sci">
			                        <li> <a href="https://www.facebook.com/Bomcorte" target="_blank"> <i class="fa fa-facebook" aria-hidden="true"></i>   </a></li>
			                        <li><a href="https://instagram.com/bom_corte_barbearia?igshid=2y4bd8uia0fz" target="_blank">  <i class="fa fa-instagram" aria-hidden="true"></i>  </a> </li>
			                        <li><a href="https://api.whatsapp.com/send?phone=5511956704687&text=Ol%C3%A1%20" target="_blank">  <i class="fa fa-whatsapp" aria-hidden="true"></i>   </a> </li>
			                        <li><a href="https://mail.google.com/mail/u/0/?tab=wm#inbox?compose=new" target="_blank">  <i class="fa fa-envelope-o" aria-hidden="true"></i> </a></li>
			                    </ul>
			            </div>
			            <div class="sec quickLinks">
			                <h2>Links Rápidos </h2>
			                <ul>
			                    <li><a class="act" href="#" onclick="$('#body').load('conteudo/sobre.html');">Sobre</a></li>
			                    <li><a class="block">Política de Privacidade</a></li>
			                    <li><a class="block">Ajuda</a></li>
			                    <li><a class="block">Termos & Condições</a></li>
			                    <li><a class="act" href="#" onclick="$('#body').load('conteudo/contato.html');">Contato</a></li>
			                </ul>
			            </div>
			            <div class="sec contact">
			                <h2>Inf. de Contato</h2>
			                <ul class="info">
			                    <li>
			                        <span><i class="fa fa-map-marker" aria-hidden="true"></i></span>
			                        <p><a href="https://www.google.com.br/maps/place/R.+Jo%C3%A3o+Francisco+Lisboa,+425b+-+Parque+Piratininga,+Itaquaquecetuba+-+SP,+08583-520/@-23.4384986,-46.3847741,17z/data=!3m1!4b1!4m5!3m4!1s0x94ce62959403abeb:0x90aae475964f96ed!8m2!3d-23.4385035!4d-46.3825854" target="_blank">Rua João Francisco Lisboa, 425b, Itaquaquecetuba - SP</a></p>
			                    </li>
			                    <li>
			                        <span><i class="fa fa-phone" aria-hidden="true"></i></span>
			                        <p><a href="https://api.whatsapp.com/send?phone=5511956704687&text=Ol%C3%A1%20" target="_blank">+55 (11) 95670-4687</a></p>
			                    </li>
			                    <li>
			                        <span><i class="fa fa-envelope-o" aria-hidden="true"></i></span>
			                        <p><a href="https://mail.google.com/mail/u/0/?tab=wm#inbox?compose=new" target="_blank">bom.corte.ds@gmail.com</a></p>
			                    </li>
			                </ul>
			            </div>
			        </div>
			    </footer>
			    <div class="copyrightText">
			        <p>Desenvolvido por <span style="color: #FFC300;">LoopWare</span></p>
			    </div>
			</div>
        
        </div>
	
		
	</body>
</html>
         