<%@page import="com.project_management.entities.Student"%>
<%@page import="com.project_management.entities.Project"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.project_management.entities.Team"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Profile</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <div class="wrapper">
            <%@include file="sidebar.jsp" %>
            <%                
                if (user == null) {
                    response.sendRedirect("login_page.jsp");
                }
                int studentId = Integer.parseInt(request.getParameter("id"));
                Student student = db.getStudentById(studentId);
                Team team = db.getTeamById(student.getTeamId());
                Project project = db.getProjectById(team.getProject_id());
            %>
            <div id="content">
                <div class="container-fluid">
                    <div class=" row no-gutters">
                        <div class="d-flex justify-content-center col-md-2">
                            <img src="resources/<%= student.getProfile()%>" alt="..." class="img-thumbnail rounded" style="width: 10rem"/>
                        </div>
                        <div class="d-flex justify-content-center align-items-center col-md-5">
                            <div>
                                <h2><%= student.getFname() + " " + student.getLname()%></h2>
                                <p class="mb-0 text-dark"><%= student.getEmail()%></p>
                                <p class="mb-0 text-dark">Subject: <%= student.getPhoneNo() %></p>     
                            </div>                      
                        </div>
                        <div class="d-flex justify-content-center align-items-center col-md-5">
                            <div>
                                <p class="ml-auto mb-0 text-dark">Division: <%= student.getDivision() %></p>
                                <p class="ml-auto mb-0 text-dark">Roll no: <%= student.getRollNo() %></p>                            
                                <p class="ml-auto mb-0 text-dark">Department: <%= student.getDepartment()%></p> 
                            </div>
                        </div>
                    </div>
                    <h3 class="mb-3 mt-4">Project</h3>
                    <%
                        if(team.getStatus().equals("APPROVED")) {
                    %>
                    <div class="card mb-2 mt-2 box-shadow">
                        <div class="card-body">
                            <div class="d-flex flex-row mb-2">
                                <div>
                                    <h3 class="card-title font-weight-bold"><%= project.getTitle()%></h3>
                                </div>
                                <div class="ml-auto mt-0">
                                    <button class="btn btn-primary"><a href="project_overview.jsp?team_id=<%= team.getId() %>&project_id=<%= project.getProject_id() %>"">View</a></button>
                                </div>
                            </div>
                            
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">
                                    <h5>Description</h5>
                                    <p class="card-text"><%= project.getDescription()%></p>
                                </li>
                                
                            </ul>
                            <p class="card-text"><small class="text-muted"><%= project.getTimestamp()%></small></p>
                        </div>
                    </div>                    
                    <% }
                        else {
                    %>
                    <div class="d-flex justify-content-center">
                        <h4 class="mt-5">No Projects</h4>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="Javascript/sidebar.js"></script>   
        <script>
            if (<%= cnt%> === 0)
            {
                $('#approvals-badge').hide();
            } else
            {
                $('#approvals-badge').html(
            <%= cnt%>
                );
            }
        </script>
    </body>  
</html>
