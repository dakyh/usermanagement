package servlets;

import java.io.IOException;

import dao.UserDao;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/delete")
public class DeleteUser extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");

		if (id.matches("[0-9]+"))
		{
			UserDao.supprimer(Integer.parseInt(id));
		}
		
		response.sendRedirect("/UserManagament4/users/list");
	}	
}
