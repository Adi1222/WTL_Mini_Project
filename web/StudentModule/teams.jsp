<%-- 
    Document   : teams
    Created on : 13 Mar, 2021, 5:17:45 PM
    Author     : Aditya
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.*" %>
<%@page import="com.project_management.entities.Student" %>
<%@page import="com.project_management.entities.Task" %>
<%@page import="com.project_management.entities.Project" %>
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
        <title>Team</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>
    <body>
        <%@include file="studentnavbar.jsp" %>
        <div class="wrapper">
            <%@include file="studentsidebar.jsp" %>
            

             <%  
                DatabaseInterface db = new DatabaseInterface(ConnectionProvider.getConnection());
                Student user = (Student) session.getAttribute("currentUser"); 
                int teamid = user.getTeamId();
                Team t = db.getTeamById(teamid);
                ArrayList<Student> students = db.getStudentsByTeamId(teamid);
            %>
            
            <div id="content">
                <div class="container-fluid">
                    <div class="row">
                        <h1 class="mr-auto">Your Team</h1>
<!--                        <form class="form-inline my-2 my-lg-0">
                            <input class="form-control mr-sm-2" type="search" id="search-team-members" placeholder="Search" aria-label="Search">
                        </form>-->
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addMemberModal">Add</button>
                    </div>
<!--                    <div class="container text-center" id="loader">
                         <i class="fas fa-sync fa-3x fa-spin"></i>
                        <h3 class="mt-2">Loading...</h3>
                    </div>-->


                    <!-- Modal -->
                    <div class="modal fade" id="addMemberModal" tabindex="-1" role="dialog" aria-labelledby="addMemberModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            
                            <div class="modal-content">
                                
                                
                                <div class="modal-header">
                                        <h5 class="modal-title" id="addMemberModalLabel">Add Team Member</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                
<!--                                
                                <form class="form-inline my-2 my-lg-0">
                                    <input class="form-control mr-sm-2" type="search" id="search-team-members" placeholder="Search" aria-label="Search">
                                </form>-->
        
                                
                                
                                <form action="../AddTeamMemberServlet?team_id=<%= user.getTeamId() %>" method="post">
                                    
                                   <div class="modal-body">
                                       <!--<label class="sr-only" for="rno">Name</label>-->
                                       <input type="text" class="form-control mb-2 mr-sm-2" id="rno" name="rno" placeholder="Enter Roll No.">
                                    </div>
                                    
                                    <div class="modal-footer">
                                        <button class="btn btn-outline-success mr-2" type="submit" name="btnadd" value="1">ADD</button>
                                    </div>
                                </form>
                                    
                                    
                            </div>
                                    
                        </div>
                    </div>



                    <div class="container-fluid mt-3" id="students-container">
                            <div class="shadow-lg p-3 bg-primary rounded box-shadow">
                                <h3 class="text-light border-bottom border-gray pb-2">Team Members</h3>
                                <div class="row">                            
                                    <%
                                        for (Student s : students) {
                                    %>
                                    <div class="col-3">
                                        <div class="card mt-2 pt-3">
                                            <img class="card-img-top mx-auto" src="../resources/<%= s.getProfile()%>" alt="profile" style="width: 6rem; border-radius: 50%">
                                            <div class="card-body text-center">                                       
                                                <h5><%= s.getFname() + " " + s.getLname()%></h5>
                                                <h6 style="color:#999"><%= s.getRollNo()%></h6>
<!--                                                <a class="btn btn-primary" href="#">Profile</a>-->
                                                <div class="icons">
                                                   
                                                    <a href="#"><i class="fa fa-phone"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%
                                        }
                                    %>

                                </div>
                            </div>
                    </div>
                </div>
            </div>
            
        </div>
            
        <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="../Javascript/sidebar.js"></script>  
        <script src="../Javascript/teammembers.js"></script>
        
        <script>
            $(document).ready(function (e) {
               $('search-team-members').keyup(function () {
                   var txt = $(this).val();
                   if (txt === '')
                   {
                       $.ajax({
                           url: '',
                           success: function (data, textStatus, jqXHR) {
                                $('#loader').hide();
                                $('#students-container').html(data);
                            }    
                       });
                   }
                   else
                   {
                       console.log(txt);
                       $('#students-container').html('');
                       $.ajax({
                           url: 'search_team_members',
                           success:  function (data, textStatus, jqXHR) {
                               $('#students-container').html(data);
                           }
                       });
                   }
               });
            });
        </script>
        
        
    </body>
</html>
