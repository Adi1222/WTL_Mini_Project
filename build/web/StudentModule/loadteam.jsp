<%-- 
    Document   : loadteam
    Created on : 17 Mar, 2021, 11:08:19 AM
    Author     : Aditya
--%>

<%@page import="com.project_management.entities.Student" %>
<%@page import="com.project_management.helper.ConnectionProvider" %>
<%@page import="com.project_management.database.DatabaseInterface" %>
<%@page import="java.util.ArrayList"%>

<div class="row">
    <%
        DatabaseInterface db = new DatabaseInterface(ConnectionProvider.getConnection());
       Student student = (Student) session.getAttribute("currentUaer");
        ArrayList<Student> students = db.getStudentsByTeamId(student.getTeamId());
        for (Student s: students)
        {
            System.out.println(s.getProfile());
        
         %>
         
         <div class="col-sm-4">
             <div class="card mt-2">
                 <img src="../resources/shivam.jpg" alt="image" style="width:100%">
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
