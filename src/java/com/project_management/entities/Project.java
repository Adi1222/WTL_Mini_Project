package com.project_management.entities;

import java.sql.Timestamp;

/**
 *
 * @author Admin
 */
public class Project 
{
    private int project_id;
    private String title;
    private String description;
    private int user_id;
    private Timestamp timestamp;

    public Project() {
    }

    public Project(String title, String description, int user_id) {
        this.title = title;
        this.description = description;
        this.user_id = user_id;
    }

    public Project(int project_id, String title, String description, int user_id, Timestamp timestamp) {
        this.project_id = project_id;
        this.title = title;
        this.description = description;
        this.user_id = user_id;
        this.timestamp = timestamp;
    }

    public int getProject_id() {
        return project_id;
    }

    public void setProject_id(int project_id) {
        this.project_id = project_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }
    
}
