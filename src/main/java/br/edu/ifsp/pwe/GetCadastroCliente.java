package br.edu.ifsp.pwe;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.DBQuery;
import model.Usuario;

/**
 * Servlet implementation class GetCadastroCliente
 */
@WebServlet("/conteudo/getcadastrocliente")
public class GetCadastroCliente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetCadastroCliente() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
    	String emailDb = "";
		String nome = request.getParameter("nome");
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		String confPass = request.getParameter("confPass");
		String telefone = request.getParameter("telefone");
		String cpf = request.getParameter("cpf");
		
		Usuario usuario = new Usuario(nome, email, pass, telefone, cpf);

		DBQuery dbQuery = new DBQuery("usuario", "idUsuario, email", "idUsuario");
		ResultSet rs = dbQuery.select("email", email);
		try {
		    
		    while (rs.next()) {
		        emailDb = rs.getString("email");
		    }
		    
		    rs.close();
		} catch (SQLException e) {
		    // Handle any potential exceptions here
		    e.printStackTrace();
		}
		
		boolean emailNoBanco = emailDb.equals(email);
		boolean senhaIgual = pass.equals(confPass);
		String acao = "0";

		if (emailNoBanco 			||
			!senhaIgual 			||
			nome.length() < 3 		||
			email.length() < 13 	||
			telefone.length() != 14 ||
			cpf.length() != 11
			){
			acao = "1";
			
		} else {
			usuario.saveCadastro();
		}

		response.sendRedirect("cadastro.jsp?acao="+acao);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
