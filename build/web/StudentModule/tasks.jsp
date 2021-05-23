<%-- 
    Document   : tasks
    Created on : 13 Mar, 2021, 4:43:10 PM
    Author     : Aditya
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.project_management.entities.Student" %>
<%@page import="com.project_management.entities.Task" %>
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
        <title>Tasks</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>
    <body>
        <%@include file="studentnavbar.jsp" %>
        <div class="wrapper">
            <%@include file="studentsidebar.jsp" %>
            

            <div id="content">
                <div class="container-fluid">
                    <div id="accordion">
                        
                        <%
                            DatabaseInterface db = new DatabaseInterface(ConnectionProvider.getConnection());
                             Student user = (Student) session.getAttribute("currentUser");
                            int teamid = user.getTeamId();
                            ArrayList<Task> tasks = db.getTasksByTeamId(teamid);
                            System.out.println(tasks.size());
                            for (Task t : tasks) {
                        %>
                        
                        
                        <div class="container mb-2">
                            <div class="card">
                                <div class="card-header" id="headingOne">
                                    <div class="d-flex flex-row">
                                        <h5 class="mt-2 mr-auto">
                                            <%= t.getTitle() %>
                                        </h5>
                                            <h5 class="text-right" style="bold">Deadline:<%= t.getTimestamp() %></h5>
                                        <button class="btn btn-primary" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                                            Open
                                        </button>
                                    </div> 
                                </div>                       
                                <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
                                  <div class="card-body">
                                      <%= t.getDescription() %>
                                  </div>
                                </div>
                              </div>
                        </div>
                                  
                         
                         <%
                            }
                        %>
                        
                        
<!--                        <div class="container  mb-2">
                            <div class="card">
                            <div class="card-header" id="headingTwo">
                                <div class="d-flex flex-row">
                                    <h5 class="mt-2 mr-auto">
                                        Task name-2
                                    </h5>
                                    <button class="btn btn-primary" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                        Open
                                    </button>
                                </div>
                            </div>
                            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
                                <div class="card-body">
                                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                                </div>
                            </div>
                            </div>
                        </div>
                        
                        

                        <div class="container  mb-2">
                            <div class="card">
                                <div class="card-header" id="headingThree">
                                  <div class="d-flex flex-row">
                                      <h5 class="mt-2 mr-auto">
                                          Task name-3
                                      </h5>
                                      <button class="btn btn-primary" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                          Open
                                      </button>
                                  </div>
                                </div>
                                <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
                                  <div class="card-body">
                                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                                  </div>
                                </div>
                              </div>
                        </div>
                        -->
                        
                        
                   
                </div>
            </div>
            
        </div>
            
        <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="../Javascript/sidebar.js"></script>   
        
    </body>
</html>
