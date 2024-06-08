<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: url('img/background.jpg') no-repeat center center fixed;
        background-size: cover;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }
    .wrapper {
        width: 100%;
        max-width: 500px;
        background-color: rgba(255, 255, 255, 0.9);
        padding: 40px;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
        border-radius: 10px;
    }
    #formContent {
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    #icon {
        width: 120px;
        margin-bottom: 20px;
    }
    .fadeIn {
        animation: fadeIn 1s ease-in-out;
    }
    .fadeIn.second, .fadeIn.third, .fadeIn.fourth {
        width: 100%;
        padding: 15px;
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    .fadeIn.fourth {
        background-color: #4CAF50;
        color: white;
        border: none;
        cursor: pointer;
        font-size: 16px;
    }
    .fadeIn.fourth:hover {
        background-color: #45a049;
    }
    .alert {
        padding: 10px;
        background-color: #f44336;
        color: white;
        margin-top: 10px;
        border-radius: 5px;
        text-align: center;
        width: 100%;
    }
    @keyframes fadeIn {
        from { opacity: 0; }
        to { opacity: 1; }
    }
</style>
</head>
<body>
<%
    // Vérifier si le formulaire a été soumis
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String login = request.getParameter("login");
        String password = request.getParameter("password");

        // Validation des identifiants
        if ("admin".equals(login) && "admin".equals(password)) {
            // Rediriger vers la page index.html
            response.sendRedirect("/UserManagament4");
        } else {
            // Afficher un message d'erreur
            out.println("<div class='alert'>Invalid login or password</div>");
        }
    }
%>
<div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Icon -->
    <div class="fadeIn first">
      <img src="img/icon_admin.png" id="icon" alt="User Icon" />
    </div>

    <!-- Login Form -->
    <form method="post" action="login.jsp">
      <input type="text" id="login" class="fadeIn second" name="login" placeholder="login">
      <input type="password" id="password" class="fadeIn third" name="password" placeholder="password">
      <input type="submit" class="fadeIn fourth" value="Log In"><hr>
    </form>
  </div>
</div>
</body>
</html>
