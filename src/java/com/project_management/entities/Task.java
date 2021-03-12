/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.project_management.entities;

import java.sql.Timestamp;

/**
 *
 * @author Admin
 */
public class Task {
    private int id;
    private String title;
    private String description;
    private int teamId;
    private String status;
    private String mentorApproval;
    private String coordinatorApproval;
    private Timestamp timestamp;
    private String grade;

    public Task() {
    }

    public Task(String title, String description, int teamId, String status, String mentorApproval, String coordinatorApproval) {
        this.title = title;
        this.description = description;
        this.teamId = teamId;
        this.status = status;
        this.mentorApproval = mentorApproval;
        this.coordinatorApproval = coordinatorApproval;
    }

    public Task(int id, String title, String description, int teamId, String status, String mentorApproval, String coordinatorApproval, Timestamp timestamp, String grade) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.teamId = teamId;
        this.status = status;
        this.mentorApproval = mentorApproval;
        this.coordinatorApproval = coordinatorApproval;
        this.timestamp = timestamp;
        this.grade = grade;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public int getTeamId() {
        return teamId;
    }

    public void setTeamId(int teamId) {
        this.teamId = teamId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getMentorApproval() {
        return mentorApproval;
    }

    public void setMentorApproval(String mentorApproval) {
        this.mentorApproval = mentorApproval;
    }

    public String getCoordinatorApproval() {
        return coordinatorApproval;
    }

    public void setCoordinatorApproval(String coordinatorApproval) {
        this.coordinatorApproval = coordinatorApproval;
    }

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }
  
}
