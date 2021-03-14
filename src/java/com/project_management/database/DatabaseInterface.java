package com.project_management.database;

import com.project_management.entities.Coordinator;
import com.project_management.entities.Mentor;
import com.project_management.entities.Project;
import com.project_management.entities.Student;
import com.project_management.entities.Team;
import java.sql.*;
import java.util.ArrayList;

public class DatabaseInterface 
{
    private Connection con;

    public DatabaseInterface(Connection con) {
        this.con = con;
    }

    public DatabaseInterface() {
    }
    
    public boolean saveProject(Project project)
    {
        boolean dataInserted = false;
        try
        {
            String query = "insert into project(title, description, user_id) values(?,?);";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, project.getTitle());
            pstmt.setString(2, project.getDescription());
            pstmt.executeUpdate();
            dataInserted = true;
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return dataInserted;
    }
    
    public int getApprovalCount()
    {
        int cnt = 0;
        try
        {
            String query = "select count(*) from teams where approvalStatus = 'PENDING'";
            PreparedStatement pstmt = con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            rs.next();
            cnt = rs.getInt(1);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return cnt;
    }
    
    public ArrayList<Team> getTeamApprovals()
    {
        ArrayList<Team> approvals = new ArrayList<>();
        try
        {
            String query = "select * from teams where approvalStatus = 'PENDING'";
            PreparedStatement pstmt = con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            while(rs.next())
            {
                int id = rs.getInt("id");
                int created_by = rs.getInt("createdBy");
                int project_id = rs.getInt("projectId");
                int mentor_id = rs.getInt("mentorId");
                int approved_by = rs.getInt("approvedBy");
                String status = rs.getString("approvalStatus");
                Timestamp timestamp = rs.getTimestamp("timestamp");
                Team team = new Team(id, created_by, project_id, mentor_id, approved_by, status, timestamp);
                approvals.add(team);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return approvals;
    }
    
    public ArrayList<Team> getTeams()
    {
        ArrayList<Team> approvals = new ArrayList<>();
        try
        {
            String query = "select * from teams where approvalStatus = 'APPROVED'";
            PreparedStatement pstmt = con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            while(rs.next())
            {
                int id = rs.getInt("id");
                int created_by = rs.getInt("createdBy");
                int project_id = rs.getInt("projectId");
                int mentor_id = rs.getInt("mentorId");
                int approved_by = rs.getInt("approvedBy");
                String status = rs.getString("approvalStatus");
                Timestamp timestamp = rs.getTimestamp("timestamp");
                Team team = new Team(id, created_by, project_id, mentor_id, approved_by, status, timestamp);
                approvals.add(team);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return approvals;
    }
    
    public ArrayList<Team> getTeamsByCoordinatorId(int coordinatorId)
    {
        ArrayList<Team> approvals = new ArrayList<>();
        try
        {
            String query = "select * from teams where approvalStatus = 'APPROVED' and approvedBy=?;";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, coordinatorId);
            ResultSet rs = pstmt.executeQuery();
            while(rs.next())
            {
                int id = rs.getInt("id");
                int created_by = rs.getInt("createdBy");
                int project_id = rs.getInt("projectId");
                int mentor_id = rs.getInt("mentorId");
                int approved_by = rs.getInt("approvedBy");
                String status = rs.getString("approvalStatus");
                Timestamp timestamp = rs.getTimestamp("timestamp");
                Team team = new Team(id, created_by, project_id, mentor_id, approved_by, status, timestamp);
                approvals.add(team);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return approvals;
    }
    
    public boolean updateApprovalStatus(String status, int teamId, int coordinatorId)
    {
        boolean f = false;
        try
        {
            String query = "update teams set approvalStatus=? , approvedBy=? where id=?;";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, status);
            pstmt.setInt(2, coordinatorId);
            pstmt.setInt(3, teamId);
            System.out.println(pstmt);
            pstmt.executeUpdate();
            f = true;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }
    
    public Team getTeamById(int teamId)
    {
        Team team = null;
        try
        {
            String query = "select * from teams where id=?;";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, teamId);
            System.out.println(pstmt.toString());
            ResultSet rs = pstmt.executeQuery();            
            if(rs.next())
            {
                int id = rs.getInt("id");
                int created_by = rs.getInt("createdBy");
                int project_id = rs.getInt("projectId");
                int mentor_id = rs.getInt("mentorId");
                int approved_by = rs.getInt("approvedBy");
                String status = rs.getString("approvalStatus");
                Timestamp timestamp = rs.getTimestamp("timestamp");
                team = new Team(id, created_by, project_id, mentor_id, approved_by, status, timestamp);               
            }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return team;
    }
    
    public Project getProjectById(int projectId)
    {
        Project project = null;
        try
        {
            String query = "select * from projects where id=?;";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, projectId);
            System.out.println(pstmt.toString());
            ResultSet rs = pstmt.executeQuery();            
            if(rs.next())
            {
                project = new Project();
                project.setProject_id(rs.getInt("id"));
                project.setTitle(rs.getString("title"));
                project.setDescription(rs.getString("description"));
                project.setTimestamp(rs.getTimestamp("timestamp"));                
            }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return project;
    }
    
    public boolean saveCoordinator(Coordinator coordinator)
    {
        boolean dataInserted = false;
        try
        {          
            String query = "insert into coordinators(fname, lname, department, subject, email, password, profile) values(?,?,?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, coordinator.getFname());
            pstmt.setString(2, coordinator.getLname());
            pstmt.setString(3, coordinator.getDepartment());
            pstmt.setString(4, coordinator.getSubject());
            pstmt.setString(5, coordinator.getEmail());
            pstmt.setString(6, coordinator.getPassword());
            pstmt.setString(7, coordinator.getProfile());
            pstmt.executeUpdate();
            dataInserted = true;
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return dataInserted;
    }
    
    public Student getStudentByEmailAndPassword(String email, String password)
    {
        Student student  = null;
        
        try
        {
            String query = "select * from students where email=? and password=?;";
            PreparedStatement stups = con.prepareStatement(query);
            stups.setString(1, email);
            stups.setString(2, password);
            ResultSet sturs = stups.executeQuery();
            
            if(sturs.next())
            {
                
                student.setId(sturs.getInt("id"));
                student.setFname(sturs.getString("fname"));
                student.setLname(sturs.getString("lname"));
                student.setDepartment(sturs.getString("department"));
                student.setDivision(sturs.getString("division"));
                student.setRollNo(sturs.getString("rollNo"));
                student.setPhoneNo(sturs.getString("phoneNo"));
                student.setEmail(sturs.getString("email"));
                student.setPassword(sturs.getString("password"));
                student.setTeamId(sturs.getInt("teamId"));
                student.setTimestamp(sturs.getTimestamp("timestamp"));
                student.setProfile(sturs.getString("profile"));
                
            }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return student;
        
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
                coordinator.setProfile(rs.getString("profile"));
                coordinator.setTime(rs.getTimestamp("timestamp"));
            }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return coordinator;
    }
    
    public Mentor getMentorByEmailAndPassword(String email, String password)
    {
        Mentor mentor  = null;
        
        try
        {
            String query = "select * from mentors where email=? ans password=?";
            PreparedStatement mps = con.prepareStatement(query);
            mps.setString(1, email);
            mps.setString(2, password);
            ResultSet mrs = mps.executeQuery();
            
            if(mrs.next())
            {
                
                mentor.setId(mrs.getInt("id"));
                mentor.setFname(mrs.getString("fname"));
                mentor.setLname(mrs.getString("lname"));
                mentor.setSkills(mrs.getString("skills"));
                mentor.setEmail(mrs.getString("email"));
                mentor.setPassword(mrs.getString("password"));
                mentor.setTimestamp(mrs.getTimestamp("timestamp"));
                mentor.setProfile(mrs.getString("profile"));
                
            }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return mentor;
        
    }
    
    
    
    public ArrayList<Mentor> getMentors()
    {
        ArrayList<Mentor> mentors = new ArrayList<Mentor>();
        try
        {            
            String query = "select * from mentors";
            PreparedStatement pstmt = con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery(); 
            while(rs.next())
            {
                int id = rs.getInt("id");
                String fname = rs.getString("fname");
                String lname = rs.getString("lname");
                String skills = rs.getString("skills");
                String email = rs.getString("email");
                String password = rs.getString("password");
                Timestamp timestamp = rs.getTimestamp("timestamp");
                String profile = rs.getString("profile");
                Mentor mentor = new Mentor(id, fname, lname, skills, email, password, timestamp, profile);
                mentors.add(mentor);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return mentors;
    }
    
    public ArrayList<Mentor> getMentorsByName(String search)
    {
        ArrayList<Mentor> mentors = new ArrayList<Mentor>();
        try
        {            
            String query = "select * from mentors where fname like '%" + search + "%' or lname like '%" + search + "%'";
            PreparedStatement pstmt = con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery(); 
            while(rs.next())
            {
                int id = rs.getInt("id");
                String fname = rs.getString("fname");
                String lname = rs.getString("lname");
                String skills = rs.getString("skills");
                String email = rs.getString("email");
                String password = rs.getString("password");
                Timestamp timestamp = rs.getTimestamp("timestamp");
                String profile = rs.getString("profile");
                Mentor mentor = new Mentor(id, fname, lname, skills, email, password, timestamp, profile);
                mentors.add(mentor);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return mentors;
    }
    
    public boolean saveStudent(Student student)
    {
        boolean dataInserted = false;
        try
        {          
            String query = "insert into coordinators(fname, lname, department, subject, email, password, profile) values(?,?,?,?,?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, student.getFname());
            pstmt.setString(2, student.getLname());
            pstmt.setString(3, student.getDepartment());
            pstmt.setString(4, student.getDivision());
            pstmt.setString(5, student.getRollNo());
            pstmt.setString(6, student.getPhoneNo());
            pstmt.setString(7, student.getEmail());
            pstmt.setString(8, student.getPassword());
            pstmt.setString(9, student.getProfile());
            pstmt.executeUpdate();
            dataInserted = true;
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return dataInserted;
    }
    
    public ArrayList<Student> getStudents()
    {
        ArrayList<Student> students = new ArrayList<Student>();
        try
        {            
            String query = "select * from students";
            PreparedStatement pstmt = con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery(); 
            while(rs.next())
            {
                int id = rs.getInt("id");
                String fname = rs.getString("fname");
                String lname = rs.getString("lname");
                String department = rs.getString("department");
                String division = rs.getString("division");
                String rollNo = rs.getString("rollNo");
                String phoneNo = rs.getString("phoneNo");
                String email = rs.getString("email");
                String password = rs.getString("password");
                int teamId = rs.getInt("teamId");
                Timestamp timestamp = rs.getTimestamp("timestamp");
                String profile = rs.getString("profile");
                Student student = new Student(id, fname, lname, department, division, rollNo, phoneNo, email, password, teamId, timestamp, profile);
                students.add(student);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return students;
    }
    
    public ArrayList<Student> getStudentsByName(String search)
    {
        ArrayList<Student> students = new ArrayList<Student>();
        try
        {            
            String query = "select * from students where fname like '%" + search + "%' or lname like '%" + search + "%'";
            PreparedStatement pstmt = con.prepareStatement(query);
            System.out.println(pstmt);
            ResultSet rs = pstmt.executeQuery(); 
            while(rs.next())
            {
                int id = rs.getInt("id");
                String fname = rs.getString("fname");
                String lname = rs.getString("lname");
                String department = rs.getString("department");
                String division = rs.getString("division");
                String rollNo = rs.getString("rollNo");
                String phoneNo = rs.getString("phoneNo");
                String email = rs.getString("email");
                String password = rs.getString("password");
                int teamId = rs.getInt("teamId");
                Timestamp timestamp = rs.getTimestamp("timestamp");
                String profile = rs.getString("profile");
                Student student = new Student(id, fname, lname, department, division, rollNo, phoneNo, email, password, teamId, timestamp, profile);
                students.add(student);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return students;
    }
    
    public Student getStudentById(int sid)
    {
        Student student = null;
        try
        {            
            String query = "select * from students where id=" + sid + ";";
            PreparedStatement pstmt = con.prepareStatement(query);
            System.out.println(pstmt);
            ResultSet rs = pstmt.executeQuery(); 
            if(rs.next())
            {
                int id = rs.getInt("id");
                String fname = rs.getString("fname");
                String lname = rs.getString("lname");
                String department = rs.getString("department");
                String division = rs.getString("division");
                String rollNo = rs.getString("rollNo");
                String phoneNo = rs.getString("phoneNo");
                String email = rs.getString("email");
                String password = rs.getString("password");
                int teamId = rs.getInt("teamId");
                Timestamp timestamp = rs.getTimestamp("timestamp");
                String profile = rs.getString("profile");
                student = new Student(id, fname, lname, department, division, rollNo, phoneNo, email, password, teamId, timestamp, profile);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return student;
    }
    
    public ArrayList<Student> getStudentsByTeamId(int team_id)
    {
        ArrayList<Student> students = new ArrayList<Student>();
        try
        {            
            String query = "select * from students where teamId=?;";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, team_id);
            System.out.println(pstmt);
            ResultSet rs = pstmt.executeQuery(); 
            while(rs.next())
            {
                int id = rs.getInt("id");
                String fname = rs.getString("fname");
                String lname = rs.getString("lname");
                String department = rs.getString("department");
                String division = rs.getString("division");
                String rollNo = rs.getString("rollNo");
                String phoneNo = rs.getString("phoneNo");
                String email = rs.getString("email");
                String password = rs.getString("password");
                int teamId = rs.getInt("teamId");
                Timestamp timestamp = rs.getTimestamp("timestamp");
                String profile = rs.getString("profile");
                Student student = new Student(id, fname, lname, department, division, rollNo, phoneNo, email, password, teamId, timestamp, profile);
                students.add(student);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return students;
    }
}
