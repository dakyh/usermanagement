package servlets;

import java.util.ArrayList;

import beans.User;
import dao.UserDao;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class ListUser
 */
@WebServlet({ "", "/users/list" })
public class ListUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final String LIST_USER_VIEW = "/WEB-INF/listUser.jsp";

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath()); 

	    ArrayList<User> utilisateurs = UserDao.lister();
		request.setAttribute("utilisateurs", utilisateurs);
		
		getServletContext().getRequestDispatcher(LIST_USER_VIEW).forward(request, response);
	}

}
