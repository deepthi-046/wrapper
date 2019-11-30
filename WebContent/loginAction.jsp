<%--
author:TechTycoons
document:LoginAction
created:30-10-2019


--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  
<%@page import="beans.Loginbean" %>
<%@page import="Dao.LoginDao" %>
<%@page import="java.sql.*" %>
<html>
<head>
<script type="text/javascript">
function invalid(){
	alert("invalid user name&Password!!:(");
			window.location="cust_login.html";
}
</script>
</head>
</html>
<%

    String cuname=request.getParameter("customeruname");
    String pass=request.getParameter("password");
    session.setAttribute("customername",cuname);
    session.setAttribute("password",pass);
    System.out.println("customer"+cuname);
    Loginbean loginBean=new Loginbean();
    loginBean.setUsername(cuname);
    loginBean.setPassword(pass);
    String customername=LoginDao.getUserName(loginBean);
    ResultSet rs=LoginDao.checking(loginBean);
    System.out.println("customer"+ customername);
   if(rs.next()){
	   session.setAttribute("customername",customername);
	  
	   response.sendRedirect("myAccount.jsp?customername="+customername);
   }
   else{ %>
	   <script>invalid();</script><%} %>
    
    