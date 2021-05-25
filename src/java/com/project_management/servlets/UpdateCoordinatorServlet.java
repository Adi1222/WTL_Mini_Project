/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.project_management.servlets;

import com.project_management.database.DatabaseInterface;
import com.project_management.entities.Coordinator;
import com.project_management.entities.Guideline;
import com.project_management.helper.ConnectionProvider;
import com.project_management.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Admin
 */
public class UpdateCoordinatorServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateCoordinatorServlet</title>");
            out.println("</head>");
            out.println("<body>");

            HttpSession session = request.getSession();
            Coordinator c_old = (Coordinator) session.getAttribute("currentUser");
            
            String fname = request.getParameter("first-name");
            String lname = request.getParameter("last-name");
            String dept = request.getParameter("dept");
            String subject = request.getParameter("subject");
            Part profile = request.getPart("profile");
            String fileName; 
            if(profile == null)
            {
                fileName = c_old.getProfile();
            }
            else
            {
                fileName = profile.getSubmittedFileName();
            }
            String path = request.getRealPath("/") + "guidelines" + File.separator + fileName;
            if(profile != null) 
            {
                if (Helper.saveFile(profile.getInputStream(), path)) 
                {
                    System.out.println("image saved successfully");
                }
            }
           
            System.out.println("fname: " + fname);
            System.out.println("lname: " + lname);
            
            Coordinator c = new Coordinator(c_old.getId(), fname, lname, dept, subject, fileName);
            
            DatabaseInterface db = new DatabaseInterface(ConnectionProvider.getConnection());
            if(db.updateCoordinator(c_old.getId(), fname, lname, dept, subject, fileName))
            {
                out.println("<h1>Success</h1>");
            }

            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
