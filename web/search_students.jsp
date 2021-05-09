<%@page import="com.project_management.entities.Team"%>
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
            <img class="card-img-top mx-auto mt-3" src="resources/<%= s.getProfile() %>" alt="profile" style="width: 6rem;">
            <div class="card-body text-center">
                <h4><%= s.getFname() + " " + s.getLname()%></h4>
                <h5><%= s.getEmail()%></h5>
                <%
                    Team t = db.getTeamById(s.getTeamId());
                    if(s.getTeamId() == 0 || t.getStatus().equals("REJECTED") || t.getStatus().equals("PENDING"))
                    {
                %>
                
                 <h6 style="color:#999">Not in team</h6>
                
                <%   
                    }
                    else
                    {                        
                %>
                
                    <h6 style="color:#999"> Team ID: <%= s.getTeamId() %></h6>
                 
                <%
                    }
                %>
                <button class="btn btn-primary"><a href="student_profile.jsp?id=<%= s.getId() %>" >Profile</a></button>
            </div>
        </div>
    </div>


    <%
        }
    %>
</div>