<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.Map" %>
<%@page import="beans.User" %>
<%@page language="java" pageEncoding="ISO-8859-1"%>
<% final String APP_ROOT = request.getContextPath(); %>

<% 
	Boolean status = (Boolean) request.getAttribute("status");
	String statusMessage = (String) request.getAttribute("statusMessage");
	User user = (User) request.getAttribute("user");
	Map<String, String> erreurs = (Map<String, String>) request.getAttribute("erreurs");
%>

<!DOCTYPE html>
<html>
	<head>
    <title>Ajout d'un utilisateur</title>
    <link rel="stylesheet" type="text/css" href="<%= APP_ROOT %>/css/style.css">
</head>
<body>
    <header>Ajout d'un utilisateur</header>
    <%@ include file="shared/nav.jsp" %>

    <section>
        <c:if test="${not empty statusMessage}">
            <div class="alert alert-${status ? 'success' : 'danger'}">
                ${statusMessage}
            </div>
        </c:if>
        <h1>Ajout d'un utilisateur</h1>
        <form method="post">
            <fieldset>
                <legend>Ajout d'un utilisateur</legend>
                <div>
                    <label>Nom</label><br>
                    <input type="text" name="nom" value="${user != null ? user.nom : ''}">
                    <c:if test="${not empty erreurs.nom}">
                        <span class="errorText">${erreurs.nom}</span>
                    </c:if>
                </div>
                <div>
                    <label>Prénom</label>
                    <input type="text" name="prenom" value="${user != null ? user.prenom : ''}">
                    <c:if test="${not empty erreurs.prenom}">
                        <span class="errorText">${erreurs.prenom}</span>
                    </c:if>
                </div>
                <div>
                    <label>Login</label>
                    <input type="text" name="login" value="${user != null ? user.login : ''}">
                    <c:if test="${not empty erreurs.login}">
                        <span class="errorText">${erreurs.login}</span>
                    </c:if>
                </div>
                <div>
                    <label>Email</label>
                    <input type="email" name="email" value="${user != null ? user.email : ''}">
                    <c:if test="${not empty erreurs.email}">
                        <span class="errorText">${erreurs.email}</span>
                    </c:if>
                </div>
                <div>
                    <label>Adresse</label>
                    <input type="text" name="adresse" value="${user != null ? user.adresse : ''}">
                    <c:if test="${not empty erreurs.adresse}">
                        <span class="errorText">${erreurs.adresse}</span>
                    </c:if>
                </div>
                <div>
                    <label>Date de naissance</label>
                    <input type="date" name="datedenaissance" value="${user != null ? user.dateDeNaissance : ''}">
                    <c:if test="${not empty erreurs.datedenaissance}">
                        <span class="errorText">${erreurs.datedenaissance}</span>
                    </c:if>
                </div>
                <div>
                    <label>Password</label>
                    <input type="password" name="password" value="${user != null ? user.password : ''}">
                    <c:if test="${not empty erreurs.password}">
                        <span class="errorText">${erreurs.password}</span>
                    </c:if>
                </div>
                <div>
                    <input type="submit" value="Ajouter">
                </div>
            </fieldset>
        </form>
    </section>
<%@ include file="shared/footer.jsp" %>