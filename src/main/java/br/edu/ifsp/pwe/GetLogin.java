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

/**
 * Servlet implementation class GetLogin
 */
@WebServlet("/conteudo/getlogin")
public class GetLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		String emailDb = "";
		String passDb = "";
		String idUsuarioDb = "";

		DBQuery dbQuery = new DBQuery("usuario", "idUsuario, email, senha", "idUsuario");
		ResultSet rs = dbQuery.selectLogin("idUsuario, email, senha", email);
		try {
		    while (rs.next()) {
		    	idUsuarioDb = ""+rs.getInt("idUsuario");
		        emailDb = rs.getString("email");
		        passDb = rs.getString("senha");
		    }
		    
		    rs.close();
		} catch (SQLException e) {
		    // Handle any potential exceptions here
		    e.printStackTrace();
		}
		
		boolean emailNoBanco = emailDb.equals(email);
		boolean senhaIgual = passDb.equals(pass);
		String acao = "0";
		
		if (emailNoBanco && senhaIgual) {
			acao = "1";
		}
		response.sendRedirect("checkLogin.jsp?acao="+acao+"&idUsuario="+idUsuarioDb);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
