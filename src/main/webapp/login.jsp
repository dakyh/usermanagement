<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: pink; /* Changer le fond en rose */
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }
    .wrapper {
        width: 100%;
        max-width: 800px; /* Augmenté pour plus de largeur */
        background-color: rgba(255, 255, 255, 0.9);
        padding: 50px; /* Augmenté pour plus de padding */
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
        border-radius: 10px;
    }
    #formContent {
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    #icon {
        width: 150px; /* Augmenté pour un icône plus grand */
        margin-bottom: 20px;
    }
    .fadeIn {
        animation: fadeIn 1s ease-in-out;
    }
    .fadeIn.second, .fadeIn.third, .fadeIn.fourth {
        width: 100%;
        padding: 20px; /* Augmenté pour plus de padding */
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
        font-size: 20px; /* Augmenté pour une meilleure lisibilité */
    }
    .fadeIn.fourth {
        background-color: #4CAF50;
        color: white;
        border: none;
        cursor: pointer;
        font-size: 20px; /* Augmenté pour correspondre aux champs */
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
        font-size: 18px; /* Augmenté pour une meilleure lisibilité */
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
      <img src="img/img.webp" id="icon" alt="User Icon" />
    </div>

    <!-- Login Form -->
    <form method="post" action="login.jsp">
      <input type="text" id="login" class="fadeIn second" name="login" placeholder="Login">
      <input type="password" id="password" class="fadeIn third" name="password" placeholder="Password">
      <input type="submit" class="fadeIn fourth" value="Log In">
    </form>
  </div>
</div>
</body>
</html>
