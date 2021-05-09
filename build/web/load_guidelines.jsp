<%@page import="java.util.Date"%>
<%@page import="com.project_management.entities.Guideline"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.project_management.entities.Mentor"%>
<%@page import="com.project_management.helper.ConnectionProvider"%>
<%@page import="com.project_management.database.DatabaseInterface"%>

<div class="row">
    <%
        DatabaseInterface db = new DatabaseInterface(ConnectionProvider.getConnection());
        ArrayList<Guideline> guidelines = db.getGuidelines();
        for (Guideline g : guidelines) {
            Date d = new Date(g.getTimestamp().getTime());
    %>
    <div class="card w-100 mt-2">
        
        <div class="card-body">
            <div class="row">
                <div class="d-flex col-sm-1">
                    <img class="ml-auto mr-auto align-self-center" src="Images/paper.png" alt="Card image cap" style="width: 3rem;">
                </div>
                <div class="d-flex col-sm-8">
                    <div class="align-self-center">
                        <h3 class="card-title mb-0"><%= g.getTitle() %></h3>
                        <p class="mb-0"><%= d %></p>
                    </div>                    
                </div>
                <div class="d-flex justify-content-end col-sm-3">
                    <div class="align-self-center">
                        <a href="DownloadGuidelineServlet?fileName=<%= g.getFilename() %>" class="btn btn-primary">Download</a>
                    </div>
                    
                </div>
            </div>  
        </div>
    </div>
    <%
        }
    %>
</div>