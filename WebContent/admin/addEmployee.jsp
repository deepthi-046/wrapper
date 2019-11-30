<%--
author:TechTycoons
document:Feedback
created:17-11-2019


--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="header.html" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Wrapper Hero</title>

        <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet"> 
        <link rel="stylesheet" href="css/empstyle.css">
        </head>
<div class="wrapper">
  <form class="myForm" action="addempAction.jsp" method="post">
    <div class="formInstructionsDiv formElement">
      <h2 class="formTitle" >Add Employee</h2>
      <p class="instructionsText">Please fill in this form to create an account</p>
     </div>
    <div class="fillContentDiv formElement">
    <div class="names formContentElement">
    </div>
    <label>
      <input class="inputRequest formContentElement" type="text" name="empname" placeholder=" Employee Name" required/>
	</label>  
    
      <label>
        <input class="inputRequest formContentElement" type="password" name="emppswd"placeholder="Enter password" required>
      </label>
      
      <label>
        <input class="inputRequest formContentElement" type="text" name="emprole" placeholder="Enter Role" required>
      </label>
      
      <label>
        <input class="inputRequest formContentElement" type="text" name="emplocation" placeholder="Enter Location" required>
      </label>
  
    <div class="submitButtonDiv formElement">
    
    <button class="submitButton">Add Emp</button>
    </div>
    </div>
  </form>
</div>
</html>