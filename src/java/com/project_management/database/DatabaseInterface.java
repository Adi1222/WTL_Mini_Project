package com.project_management.database;

import com.project_management.entities.Coordinator;
import com.project_management.entities.Mentor;
import com.project_management.entities.Project;
import com.project_management.entities.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DatabaseInterface 
{
    private Connection con;

    public DatabaseInterface(Connection con) {
        this.con = con;
    }

    public DatabaseInterface() {
    }

    public boolean saveUser(User user)
    {
        boolean dataInserted = false;
        try
        {          
            String query = "insert into users(user_name, user_first_name, user_last_name, user_email, user_phone, user_password, user_pic_name, pathname) values(?,?,?,?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getFirst_name());
            pstmt.setString(3, user.getLast_name());
            pstmt.setString(4, user.getEmail());
            pstmt.setString(5, user.getPhone());
            pstmt.setString(6, user.getPassword());
            pstmt.setString(7, user.getFilename());
            pstmt.setString(8, user.getFilepath());
            pstmt.executeUpdate();
            dataInserted = true;
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return dataInserted;
    }
    
    public boolean saveProject(Project project)
    {
        boolean dataInserted = false;
        try
        {
            String query = "insert into project(title, description, user_id) values(?,?,?);";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, project.getTitle());
            pstmt.setString(2, project.getDescription());
            pstmt.setInt(3, project.getUser_id());
            pstmt.executeUpdate();
            dataInserted = true;
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return dataInserted;
    }
    
    public User getUserByEmailAndPassword(String email, String password)
    {
        User user = null;
        try
        {
            String query = "select * from users where user_email=? and user_password=?;";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            ResultSet rs = pstmt.executeQuery();            
            if(rs.next())
            {
                user = new User();
                user.setId(rs.getInt("user_id"));
                user.setUsername(rs.getString("user_name"));
                user.setFirst_name(rs.getString("user_first_name"));
                user.setLast_name(rs.getString("user_last_name"));
                user.setEmail(rs.getString("user_email"));
                user.setPhone(rs.getString("user_phone"));
                user.setPassword(rs.getString("user_password"));
                user.setFilename(rs.getString("user_pic_name"));
                user.setFilepath(rs.getString("pathname"));
                user.setTime(rs.getTimestamp("user_timestamp"));
            }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return user;
    }
     
    public int getProjectByUserIdAndTitle(int userId, String title)
    {
        int projectId = -1;
        try
        {
            String query = "select project_id from project where title=? and user_id=?;";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, title);
            pstmt.setInt(2, userId);
            ResultSet rs = pstmt.executeQuery();            
            if(rs.next())
            {
                projectId = rs.getInt("project_id");
            }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return projectId;
    }
    
    public Project getProjectById(int projectId)
    {
        Project project = null;
        try
        {
            String query = "select * from project where project_id=?;";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, projectId);
            System.out.println(pstmt.toString());
            ResultSet rs = pstmt.executeQuery();            
            if(rs.next())
            {
                project = new Project();
                project.setProject_id(rs.getInt("project_id"));
                project.setTitle(rs.getString("title"));
                project.setDescription(rs.getString("description"));
                project.setUser_id(rs.getInt("user_id"));
                project.setTimestamp(rs.getTimestamp("timestamp"));                
            }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        System.out.println(project.getTitle());
        return project;
    }
    
    public boolean saveCoordinator(Coordinator coordinator)
    {
        boolean dataInserted = false;
        try
        {          
            String query = "insert into coordinators(fname, lname, department, subject, email, password) values(?,?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, coordinator.getFname());
            pstmt.setString(2, coordinator.getLname());
            pstmt.setString(3, coordinator.getDepartment());
            pstmt.setString(4, coordinator.getSubject());
            pstmt.setString(5, coordinator.getEmail());
            pstmt.setString(6, coordinator.getPassword());
            pstmt.executeUpdate();
            dataInserted = true;
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return dataInserted;
    }
    
    public Coordinator getCoordinatorByEmailAndPassword(String email, String password)
    {
        Coordinator coordinator = null;
        try
        {
            String query = "select * from coordinators where email=? and password=?;";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            ResultSet rs = pstmt.executeQuery();            
            if(rs.next())
            {
                coordinator = new Coordinator();
                coordinator.setId(rs.getInt("id"));                
                coordinator.setFname(rs.getString("fname"));                
                coordinator.setLname(rs.getString("lname"));
                coordinator.setDepartment(rs.getString("department"));
                coordinator.setSubject(rs.getString("subject"));
                coordinator.setEmail(rs.getString("email"));
                coordinator.setPassword(rs.getString("password"));
                coordinator.setTime(rs.getTimestamp("timestamp"));
            }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return coordinator;
    }
    
    public ArrayList<Mentor> getMentors()
    {
        ArrayList<Mentor> mentors = new ArrayList<Mentor>();
        try
        {            
            String query = "select * from mentors";
            PreparedStatement pstmt = con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery(); 
            if(rs.next())
            {
                int id = rs.getInt("id");
                String fname = rs.getString("fname");
                String lname = rs.getString("lname");
                String skills = rs.getString("skills");
                String email = rs.getString("email");
                String password = rs.getString("password");
                Timestamp timestamp = rs.getTimestamp("timestamp");
                Mentor mentor = new Mentor(id, fname, lname, skills, email, password, timestamp);
                mentors.add(mentor);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return mentors;
    }
}
