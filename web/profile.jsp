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
            %>
            <div id="content">
                <div class="container-fluid">
                    <div class="row no-gutters">
                        <div class="col-md-3">
                            <div class="d-flex justify-content-start">
                                <img src="resources/<%= user.getProfile()%>" alt="..." class="img-thumbnail rounded" style="width: 10rem"/>
                            </div>
                        </div>
                        <div class="col-md-6 d-flex justify-content-start">
                            <div>
                                <h2 class="mt-1 ml-auto"><%= user.getFname() + " " + user.getLname()%></h2>
                                <p class="ml-auto mb-0 text-dark"><%= user.getEmail() %></p>
                                <p class="ml-auto mb-0 text-dark">Department: <%= user.getDepartment()%></p>
                                <p class="ml-auto mb-0 text-dark">Subject: <%= user.getSubject()%></p>
                            </div>
                        </div>
                        <div class="col-md-3 d-flex justify-content-center align-items-center">
                            <button class="btn btn-primary" data-toggle="modal" data-target="#updateCoordinatorModal" >Edit Profile</button>
                        </div>
                    </div>
                            
                    <div class="modal fade" id="updateCoordinatorModal" tabindex="-1" role="dialog" aria-labelledby="updateCoordinatorLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="updateCoordinatorLabel">Edit profile</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <form id="coordinator" action="UpdateCoordinatorServlet" method="post" enctype='multipart/form-data'>
                                    <div class="modal-body">

                                        <div class="form-group">
                                            <label for="message-text" class="col-form-label">Profile:</label>
                                            <input type="file" class="form-control" id="profile" name="profile">
                                        </div>
                                        
                                        <div class="form-group">
                                            <label for="message-text" class="col-form-label">First name:</label>
                                            <input type="text" class="form-control" id="first-name" name="first-name" ">
                                        </div>
                                        
                                        <div class="form-group">
                                            <label for="message-text" class="col-form-label">Last name:</label>
                                            <input type="text" class="form-control" id="last-name" name="last-name" ">
                                        </div>
                                        
                                        <div class="form-group">
                                            <label for="message-text" class="col-form-label">Email:</label>
                                            <label for="message-text" class="col-form-label"><%= user.getEmail() %></label>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label for="message-text" class="col-form-label">Department:</label>
                                            <input type="text" class="form-control" id="dept" name="dept" >
                                        </div>
                                        
                                        <div class="form-group">
                                            <label for="message-text" class="col-form-label">Subject:</label>
                                            <input type="text" class="form-control" id="subject" name="subject">
                                        </div>                                      

                                    </div>
                                    <div class="modal-footer">
                                        <button class="btn btn-outline-success mr-2" type="submit" name="btnAdd">Edit</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                            
                    <h3 class="mb-3 mt-4">Approved Projects</h3>


                    <%
                        ArrayList<Team> teams = db.getTeamsByCoordinatorId(user.getId());
                        for (Team t : teams) {
                            Project p = db.getProjectById(t.getProject_id());
                            Student s = db.getStudentById(t.getCreated_by());
                    %>
                    <div class="row mt-2">
                        <div class="card w-100">
                            <div class="card-body">
                                <h3 class="card-title"><%= p.getTitle()%></h3>
                                <p class="card-text"><%= p.getDescription()%></p>
                                <button class="btn btn-primary"><a href="project_overview.jsp?team_id=<%= t.getId()%>&project_id=<%= p.getProject_id()%>">View</a></button>
                            </div>
                        </div>
                    </div>

                    <%        }
                    %>

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
        <script type="text/javascript">
            $(document).ready(function () {
                console.log('supboi');
                $('#coordinator').on('submit', function (event) {
                    event.preventDefault();
                    let form = new FormData(this);
                    $.ajax({
                        url: "UpdateCoordinatorServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textstatus, adfa) {
                            console.log(data);
                            $('#updateCoordinatorModal').modal("hide");
                        },
                        error: function (adfa, textstatus, errorThrown) {
                            console.log(adfa);
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>
    </body>  
</html>
