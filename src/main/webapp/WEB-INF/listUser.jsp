<%@page language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="beans.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.time.Instant" %>
<%@page import="java.time.LocalDate" %>
<%@page import="java.time.ZoneId" %>
<%@page import="java.time.format.DateTimeFormatter" %>
<% 
	final String APP_ROOT = request.getContextPath();
	ArrayList<User> utilisateurs = (ArrayList<User>) request.getAttribute("utilisateurs"); 
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Liste des utilisateurs</title>
		<link rel="stylesheet" type="text/css" href="<%= APP_ROOT %>/css/style.css">
	</head>
	<body>
		<header>Liste des utilisateurs</header>
		<%@ include file="shared/nav.jsp" %>
		
		<section>
			 <c:choose> 
	            <c:when test="${ empty utilisateurs }">
	                <p>Désolé, la liste des utilisateurs est vide pour le moment !</p>
	            </c:when>
	            <c:otherwise>
	                <table border="1" cellspacing="0" cellpadding="10">
	                    <tr>
	                        <th>ID</th>
	                        <th>Nom</th>
	                        <th>Prénom</th>
	                        <th>Login</th>
	                        <th>Email</th>
	                        <th>Adresse</th>
	                        <th>Date de naissance</th>
	                        <th colspan="2">Actions</th>
	                    </tr>
	                    <c:forEach items="${ requestScope.utilisateurs }" var="utilisateur">
	                        <tr>
	                            <td><c:out value="${ utilisateur.id }"/></td>
	                            <td><c:out value="${ utilisateur.nom }"/></td>
	                            <td><c:out value="${ utilisateur.prenom }"/></td>
	                            <td><c:out value="${ utilisateur.login }"/></td>
	                            <td><c:out value="${ utilisateur.email }"/></td>
	                            <td><c:out value="${ utilisateur.adresse }"/></td>
	                            <td><c:out value="${ utilisateur.dateDeNaissance }"/></td>
	                            <td><a href="<%= APP_ROOT %>/users/update?id=${ utilisateur.id }">Modifier</a></td>
	                            <td><a href="<%= APP_ROOT %>/delete?id=${ utilisateur.id }" onclick="return confirm('Etes vous sur de vouloir le supprimer ?')">Supprimer</a></td>
	                        </tr>
	                    </c:forEach>
	                </table>
	            </c:otherwise>
	        </c:choose>
		</section>
<%@ include file="shared/footer.jsp" %>