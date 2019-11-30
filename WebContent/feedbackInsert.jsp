<%--
author:TechTycoons
document:Feedback
created:30-10-2019
author:angel

--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="headerCustomer.jsp" %>

<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%> 
<%@ page import="java.sql.*" %>
<%@page import="beans.notifications" %>
<%@page import="Dao.notificationsDao" %>

<%
String name = (String)session.getAttribute("cuname");
if(name==null){
response.sendRedirect("index.html");
}
String date=request.getParameter("date");
String comment=request.getParameter("comment");
notifications eq=new notifications();
session=request.getSession(false);
String ename=(String)session.getAttribute("ename");

eq.setDate(date);
eq.setComment(comment);
boolean flag=notificationsDao.insertFeedback(eq);
if(flag==false){
	%>
	<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.alert {
 padding: 20px;
 background-color: green;
 color: white;
}

.closebtn {
 margin-left: 15px;
 color: white;
 font-weight: bold;
 float: right;
 font-size: 22px;
 line-height: 20px;
 cursor: pointer;
 transition: 0.3s;
}

.closebtn:hover {
 color: black;
}
</style>
</head>
<body>


<div class="alert">
 <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
 <strong>Your Feedback is send Sucessfully.</strong> ThankYou for using Wrapper Hero.
</div>

</body>
</html>
<%
}
else{
 
  out.println("failed");
}
%>
	