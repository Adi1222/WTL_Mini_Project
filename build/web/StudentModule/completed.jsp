<%-- 
    Document   : completed
    Created on : 13 Mar, 2021, 4:45:37 PM
    Author     : Aditya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="../error_page.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Completed Tasks</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>
    <body>
        <%@include file="studentnavbar.jsp" %>
        <div class="wrapper">
            <%@include file="studentsidebar.jsp" %>
            

            <div id="content">
                <div class="container-fluid">
                    <table class="table table-responsive table-bordered" role="grid">
                        <thead>
                          <tr>
                            <th  scope="col">No.</th>
                            <th  scope="col">Task Name</th>
                            <th  scope="col">Task Description</th>
                            <th  scope="col">Deadline</th>
                            <th  scope="col">Action</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <th scope="row">1</th>
                            <td>Task 1</td>
                            <td>Lorem ipsum dolor sit amet consectetur adipisicing elit. Magni cumque quo vitae labor</td>
                            <td>1/1/2020</td>
                            <td>
                              <button class="btn"><i class="fa fa-pencil" style="font-size: 15px;color: rgb(27, 68, 121);" aria-hidden="true"></i></button>
                              <button class="btn btn1"><i class="fa fa-trash" style="font-size: 15px;color: rgb(136, 41, 41);" aria-hidden="true"></i></button>
                          </td>
                          </tr>
                          <tr>
                            <th scope="row">1</th>
                            <td>Task 2</td>
                            <td>Lorem ipsumde eveniet nulla consequatur possimus dolorem, sint quisquam. Pariatur, qui sapiente.</td>
                            <td>1/1/2020</td>
                            <td>
                              <button class="btn"><i class="fa fa-pencil" style="font-size: 15px;color: rgb(27, 68, 121);" aria-hidden="true"></i></button>
                              <button class="btn btn1"><i class="fa fa-trash" style="font-size: 15px;color: rgb(136, 41, 41);" aria-hidden="true"></i></button>
                          </td>
                          </tr>
                          <tr>
                            <th scope="row">1</th>
                            <td>Task 3</td>
                            <td>Lorem ipsum dolor sit amet consectetur adipisicing elit. Magni cumque quo vitae laboriosam hic quas ad neque. Est officiis unde eveniet nulla consequatur possimus dolorem, sint quisquam. Pariatur, qui sapiente.</td>
                            <td>1/1/2020</td>
                            <td>
                              <button class="btn"><i class="fa fa-pencil" style="font-size: 15px;color: rgb(27, 68, 121);" aria-hidden="true"></i></button>
                              <button class="btn btn1"><i class="fa fa-trash" style="font-size: 15px;color: rgb(136, 41, 41);" aria-hidden="true"></i></button>
                          </td>
                          </tr>
                          <tr>
                            <th scope="row">1</th>
                            <td>Task 4</td>
                            <td>Lorem ipsum dolor sit amet consectetur adipisicing elit. Magni cumque quo vitae laboriosam hic quas ad neque. Est officiis unde eveniet nulla consequatur possimus dolorem, sint quisquam. Pariatur, qui sapiente.</td>
                            <td>1/1/2020</td>
                            <td>
                              <button class="btn"><i class="fa fa-pencil" style="font-size: 15px;color: rgb(27, 68, 121);" aria-hidden="true"></i></button>
                              <button class="btn btn1"><i class="fa fa-trash" style="font-size: 15px;color: rgb(136, 41, 41);" aria-hidden="true"></i></button>
                          </td>
                          </tr>
                        </tbody>
                      </table>

                </div>
            </div>
            
        </div>
            
        <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="../Javascript/sidebar.js"></script>   
        
    </body>
</html>
