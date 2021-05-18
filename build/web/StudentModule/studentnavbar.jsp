<%-- 
    Document   : studentnavbar
    Created on : 13 Mar, 2021, 4:47:18 PM
    Author     : Aditya
--%>


<%@page import="com.project_management.entities.Student" %>
<%@page import="com.project_management.helper.ConnectionProvider"%>
<%@page import="com.project_management.database.DatabaseInterface"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css?family=Barlow%7CBarlow+Condensed:400,700&amp;display=swap" rel="stylesheet">
        <link rel="stylesheet" href="../CSS/navbar.css">
    </head>
    <body>
        
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            
            
            <% 
                Student student = (Student) session.getAttribute("currentUser");
                
            %>
            
                <a class="navbar-brand" href="#">
                    <button type="button" id="sidebarCollapse" class="btn btn-info bg-primary mt-1 mr-1 d-inline-block align-top">
                        <i class="fas fa-bars"></i>
                    </button>
                    Projectify
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ml-auto">
                        <c:set var="user" value="${student}"/>    
                        <c:choose>
                            <c:when test="user != null">                            
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Login</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Register</a>
                                </li>
                            </c:when>
                            <c:otherwise >
                            <li class="nav-item">
                                <a class="nav-link" href="studentprofile.jsp">Profile</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="../LogoutServlet">Logout</a>
                            </li>
                            </c:otherwise> 
                        </c:choose> 
                    </ul>
                </div>
            </nav>
        
    </body>
</html>
