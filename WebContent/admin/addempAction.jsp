<%--
author:TechTycoons
document:Add employee
created:17-11-2019


--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="beans.Loginbean" %>
<%@page import="Dao.DBDao" %>
<%@page import="Dao.LoginDao" %>

<html>
<head>
<script  type="text/javascript">
function success(){
	alert("Sucessfully added :)");
	window.location="addEmployee.jsp";
	
}
function fail(){
	alert(" Sorry insertion failed!!! :(");
	window.location="addEmployee.jsp";
}
</script>
</head>
</html>
<%
String Name = (String)session.getAttribute("username");
if(Name==null){
response.sendRedirect("login.html");
}
String empname=request.getParameter("empname");
String emppswd=request.getParameter("emppswd");
String emprole=request.getParameter("emprole");
String emplocation=request.getParameter("emplocation");

Loginbean loginbean=new Loginbean();
loginbean.setUsername(empname);
loginbean.setPassword(emppswd);
loginbean.setRole(emprole);
loginbean.setLocation(emplocation);

boolean flag=LoginDao.addemployee(loginbean);
if(flag){%>
<script>success();</script><% 	
}
else%>
<script>fail();</script>	
