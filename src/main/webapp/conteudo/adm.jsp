<%@ page import="model.Usuario" %>
<%@ page import="database.DBQuery" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>

    	<%
    		String userId = ""+session.getAttribute("userId");
    	%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link href="../estilo/css.css" rel="stylesheet">
        <link href="../estilo/crud.css" rel="stylesheet">
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
		
			
        <div id="body">
        	
        	
	        	<%
	    			String idUsuario = ""+request.getParameter("idUsuario");
	        	    String nome = request.getParameter("nome");
	        		String email = request.getParameter("email");
	        		String senha = request.getParameter("senha");
	        		String telefone = request.getParameter("telefone");
	        		String cpf = request.getParameter("cpf");
	        		String foto = request.getParameter("foto");
	        		String idTipoUsuario = ""+request.getParameter("idTipoUsuario");
	        		
	        		String acao = request.getParameter("acao");
	        		
	        		if ((acao != null) && idUsuario != null){
	        			Usuario usuario = new Usuario(Integer.valueOf(idUsuario), nome, email, senha, telefone, cpf, foto, Integer.valueOf(idTipoUsuario));
	        				if (Integer.valueOf(acao) == 1){
	        					usuario.save();
	        				}else if(Integer.valueOf(acao) == 2){
	        					usuario.delete();
	        				}
	        				
	        		}
	        		
	        		String saida = new Usuario().listAllUsers(); 
	        		response.getWriter().write(saida);
				%>

			<div id="adm">
				<form action="adm.jsp" method="post">
	        		<h3 style="text-align:center; margin:10px 0;">Cadastro de Usuario: </h3>
	        		<div class="form-group">
	        			<label for="idUsuario">Identificação do Usuário</label>
	        			<input type="number" id="idUsuario" name="idUsuario" class="form-control" value="0" />
	        		</div>
	        		<div class="form-group">
	        			<label for="idUsuario">Nome: </label>
	        			<input type="text" id="idUsuario" name="nome" class="form-control" value="0" />
	        		</div>
	        		<div class="form-group">
	        			<label for="idUsuario">Email: </label>
	        			<input type="text" id="idUsuario" name="email" class="form-control" value="0" />
	        		</div>
	        		<div class="form-group">
	        			<label for="idUsuario">Senha: </label>
	        			<input type="text" id="idUsuario" name="senha" class="form-control" value="0" />
	        		</div>
	        		<div class="form-group">
	        			<label for="idUsuario">Telefone: </label>
	        			<input type="text" id="idUsuario" name="telefone" class="form-control" value="0" />
	        		</div>
	        		<div class="form-group">
	        			<label for="idUsuario">CPF: </label>
	        			<input type="text" id="idUsuario" name="cpf" class="form-control" value="0" />
	        		</div>
	        		        		<div class="form-group">
	        			<label for="idUsuario">Foto: </label>
	        			<input type="text" id="idUsuario" name="foto" class="form-control" value="0" />
	        		</div>
	        		
	        		<div class="form-group">
	        			<label for="idUsuario">Identificação do Tipo de Usuário: </label>
	        			<input type="text" id="idUsuario" name="idTipoUsuario" class="form-control" value="0" />
	        		</div>
	        		<input type="hidden" name="acao" value="0" />
	        		<div class="container-btn">
	        			<button type="submit" class="btnADM" class="" onclick="acao.value='1'; this.form.submt()">Salvar</button>
	        			<button type="submit" class="btnADM" class="" onclick="acao.value='2'; this.form.submt()">Excluir</button>
	        		</div>
	        		
	        	</form>
			</div>
        	
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
			                    <li><a class="act" href="#" onclick="$('#body').load('sobre.html');">Sobre</a></li>
			                    <li><a class="block">Política de Privacidade</a></li>
			                    <li><a class="block">Ajuda</a></li>
			                    <li><a class="block">Termos & Condições</a></li>
			                    <li><a class="act" href="#" onclick="$('#body').load('contato.html');">Contato</a></li>
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
         