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
 * Servlet implementation class AlterarPerfil
 */
@WebServlet("/conteudo/alterarperfil")
public class AlterarPerfil extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AlterarPerfil() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Usuario usuario = new Usuario();
		
		usuario.setNome(request.getParameter("nome"));
		usuario.setEmail(request.getParameter("email"));
		usuario.setTelefone(request.getParameter("telefone"));
		usuario.setCpf(request.getParameter("cpf"));
		
		DBQuery dbQuery = new DBQuery("usuario", "nome, telefone", "idUsuario");
		
		/*dbQuery.setFieldsName();*/
		
		String acao = ""+dbQuery.update(usuario.toArrayAlteracao());
		
		response.sendRedirect("confAlterar.jsp?acao="+acao);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
	}

}
