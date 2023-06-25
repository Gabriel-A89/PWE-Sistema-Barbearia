package br.edu.ifsp.pwe;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		String nome = request.getParameter("nome");
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		String confPass = request.getParameter("confPass");
		String telefone = request.getParameter("telefone");
		String cpf = request.getParameter("cpf");
		String acao = request.getParameter("acao");
		
		System.out.println(nome.length());
		System.out.println(email.length());
		System.out.println(pass.length());
		System.out.println(confPass.length());
		System.out.println(telefone.length());
		System.out.println(cpf.length());
		
		response.sendRedirect("cadastro.jsp?nome="+nome+"&email="+email+"&pass="+pass+"&telefone="+telefone+"&cpf="+cpf+"&acao="+acao);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
