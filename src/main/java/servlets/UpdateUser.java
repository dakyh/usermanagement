package servlets;

import java.io.IOException;
import java.time.Instant;
import java.time.format.DateTimeParseException;

import beans.User;
import dao.UserDao;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/users/update")
public class UpdateUser extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String UPDATE_USER_VIEW = "/WEB-INF/editUser.jsp";

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");

        if (id != null && id.matches("[0-9]+")) {
            User utilisateur = UserDao.get(Integer.parseInt(id));

            if (utilisateur != null) {
                request.setAttribute("utilisateur", utilisateur);
                getServletContext().getRequestDispatcher(UPDATE_USER_VIEW).forward(request, response);
                return;
            }
        }

        response.sendRedirect("/UserManagament4/users/list");
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String login = request.getParameter("login");
        String email = request.getParameter("email");
        String adresse = request.getParameter("adresse");
        String date = request.getParameter("datedenaissance");
        String password = request.getParameter("password");

        Instant datedenaissance = null;
        try {
            if (date != null && !date.isEmpty()) {
                String dateStr = date + "T00:00:00Z";
                datedenaissance = Instant.parse(dateStr);
            }
        } catch (DateTimeParseException e) {
            // Gérer l'erreur de format de date
            request.setAttribute("errorMessage", "La date de naissance est incorrecte.");
            doGet(request, response);
            return;
        }

        if (id != null && id.matches("[0-9]+")) {
            User utilisateur = new User(Integer.parseInt(id), nom, prenom, login, email, adresse, datedenaissance, password);

            if (UserDao.modifier(utilisateur)) {
                response.sendRedirect("/UserManagament4/users/list");
            } else {
                response.sendRedirect("/UserManagament4/users/update?id=" + id);
            }
        } else {
            response.sendRedirect("/UserManagament4/users/list");
        }
    }
}
