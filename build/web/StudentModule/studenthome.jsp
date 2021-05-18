<%-- 
    Document   : studenthome
    Created on : 13 Mar, 2021, 4:35:33 PM
    Author     : Aditya
--%>

<%@page import="com.project_management.entities.Student" %>
<%@page import="com.project_management.entities.Mentor" %>
<%@page import="com.project_management.entities.Team" %>
<%@page import="com.project_management.helper.ConnectionProvider"%>
<%@page import="com.project_management.database.DatabaseInterface"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="../error_page.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="../CSS/guidedetails.css">
        <title>Home</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <%@include file="studentnavbar.jsp" %>
        <div class="wrapper">
            <%@include file="studentsidebar.jsp" %>
            

            <% 
                DatabaseInterface db = new DatabaseInterface(ConnectionProvider.getConnection());
                Student user = (Student) session.getAttribute("currentUser");
                int teamid = user.getTeamId();
                Team team = (Team) db.getTeamById(teamid);
                int mid = team.getMentor_id();
                Mentor mentor = (Mentor) db.getMentorById(mid);
                
            %>
            
            <div id="content">
                <div class="container-fluid">
                    <div class="card">
                        <img src="../resources/<%= mentor.getProfile() %>" alt="guide" style="width:100%">
                        <h1><%= mentor.getFname() %></h1>
                        <p class="title">Pune Institute of Computer Technology</p>
                        <p>Computer Engineering department</p>
                        <p>Skills: <%= mentor.getSkills() %></p>
                        <p>email: <%= mentor.getEmail() %></p>
                        <div class="icons">
                            <a href="#"><i class="fa fa-linkedin"></i></a>
                            <a href="#"><i class="fa fa-phone"></i></a>
                        </div>
                        
                    </div>
                </div>
            </div>
            
        </div>
            
        <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="../Javascript/sidebar.js"></script>   
        
    </body>
</html>
