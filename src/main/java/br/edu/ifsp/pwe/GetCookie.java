package br.edu.ifsp.pwe;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GetCookie
 */
@WebServlet("/getcookie")
public class GetCookie extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetCookie() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String texto = "";
		String userId = getByName(request, "userId");
		if (userId == null) {
			texto = "Usuário não logado";
		}else {
			texto = "Usuário logado, id: "+userId;
		}
		response.getWriter().write(texto);
	}
	
	public String getByName(HttpServletRequest request, String name) {
		String var = "texto";
		Cookie[] cookies = request.getCookies();
		int i=1;
		if (cookies.length > 1) {
			while (!cookies[i].getName().equals(name) && i < cookies.length - 1){
				i++;
			}
		}
		if (i >= cookies.length) {
			return (null);
		}else {
			return (cookies[i].getName() + "|" + cookies[i].getValue());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
