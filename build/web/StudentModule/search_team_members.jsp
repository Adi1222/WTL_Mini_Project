<%-- 
    Document   : search_team_members
    Created on : 17 Mar, 2021, 12:48:16 PM
    Author     : Aditya
--%>
<%@page import="com.project_management.entities.Student"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.project_management.helper.ConnectionProvider"%>
<%@page import="com.project_management.database.DatabaseInterface"%>

<div class="row">
    <%
        DatabaseInterface db = new DatabaseInterface(ConnectionProvider.getConnection());
        String search = request.getParameter("search");
        System.out.println(search);
        ArrayList<Student> student = db.getStudentsByName(search);
        for (Student s : student) {
    %>
    
    <div class="col-md-4">
        <div class="card mt-2">
            <img class="card-img-top mx-auto mt-2" src="../resources/shivam.jpg" alt="profile" style="width: 6rem;">
                <div class="card-body text-center">
                     <h4><%= s.getFname() + " " + s.getLname() %></h4>
                     <h5><%= s.getEmail() %></h5>
                     <h6 style="color:#999">Team ID: <%= s.getTeamId() %></h6>
                     <button class="btn btn-primary"><a href="#">View Profile</a></button>
                </div>
        </div>
    </div>
                     
                                      
        <%
            }
        %>
        
    
</div>