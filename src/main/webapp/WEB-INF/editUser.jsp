<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="beans.User"%>
<%@ page language="java" pageEncoding="ISO-8859-1"%>
<%@ page import="java.time.Instant" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.ZoneId" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<% 
	final String APP_ROOT = request.getContextPath(); 
	User utilisateur = (User) request.getAttribute("utilisateur");
	
	
	LocalDate localDate = utilisateur.getDateDeNaissance().atZone(ZoneId.systemDefault()).toLocalDate();
    String formattedDate = localDate.format(DateTimeFormatter.ISO_DATE); 
%>

<!DOCTYPE html>
<html>
<head>
    <title>Modification d'un utilisateur</title>
    <link rel="stylesheet" type="text/css" href="<%= APP_ROOT %>/css/style.css">
</head>
<body>
    <header>Modification d'un utilisateur</header>
    <%@ include file="shared/nav.jsp" %>

    <section>
        <form method="post">
            <fieldset>
                <h1>Modification d'un utilisateur</h1>
                <div>
                    <label>Nom</label><br>
                    <input type="text" name="nom" value="${utilisateur.nom}"><br>
                </div>
                <div>
                    <label>Prénom</label><br>
                    <input type="text" name="prenom" value="${utilisateur.prenom}"><br>
                </div>
                <div>
                    <label>Login</label><br>
                    <input type="text" name="login" value="${utilisateur.login}"><br>
                </div>
                <div>
                    <label>Email</label><br>
                    <input type="email" name="email" value="${utilisateur.email}"><br>
                </div>
                <div>
                    <label>Adresse</label><br>
                    <input type="text" name="adresse" value="${utilisateur.adresse}"><br>
                </div>
                <div>
                    <label>Date de naissance</label><br>
                    <input type="date" name="datedenaissance" value="${utilisateur.dateDeNaissance}"><br>
                </div>
                <div>
                    <label>Password</label><br>
                    <input type="password" name="password" value="${utilisateur.password}"><br>
                </div>
                <div>
                    <input type="submit" value="Modifier">
                </div>    
            </fieldset>
        </form>
    </section>
<%@ include file="shared/footer.jsp" %>

