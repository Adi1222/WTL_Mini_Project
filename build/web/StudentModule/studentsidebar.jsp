<%-- 
    Document   : studentsidebar
    Created on : 13 Mar, 2021, 3:54:46 PM
    Author     : Aditya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://kit.fontawesome.com/a3f1b63724.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" type="text/css" href="../CSS/navbar.css">
<!--        <title>Student</title>-->
    </head>
    <body>
        <nav id="sidebar">
            <ul class="lisst-unstyled components">
<!--                <li id="home" class="active">
                    <a href="home.jsp">Home</a>
                </li>-->

                <li id="guide">
                    <a href="studenthome.jsp">Guide</a>
                </li>
                
                
                <li id="tasks">
                    <a href="tasks.jsp">Tasks</a>
                </li>
                
                <li id="teams">
                    <a href="teams.jsp">Teams</a>
                </li>
                
                <li>
                    <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Progress</a>
                    <ul class="collapse list-unstyled" id="pageSubmenu">
                        <li id="pending_tasks">
                            <a href="pending.jsp">Pending</a>
                        </li>
                        <li id="inprogres_tasks">
                            <a href="inprogress.jsp">In Progress</a>
                        </li>
                        <li id="completed_tasks">
                            <a href="completed.jsp">Completed</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </nav>
    </body>
</html>
