package com.project_management.helper;

import java.sql.*;

public class ConnectionProvider 
{
    private static Connection con;
    
    public static Connection getConnection()
    {
        try
        {
            if(con == null)
            {
                Class.forName("com.mysql.jdbc.Driver");
            }
            con = DriverManager.getConnection("jdbc:mysql://localhost:3307/projectmanagement", "root", "root1");
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return con;
    }
}
