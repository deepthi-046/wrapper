<%--
author:TechTycoons
document:login
created:17-11-2019


--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@page import="beans.Loginbean" %>
<%@page import="Dao.LoginDao" %>
<%@include file="header.html" %>
<script type="text/javascript">
function vali(){
	alert("invalid Username or password!!!!!");
	window.location="login.html";
}
</script>

<%

    String ename=request.getParameter("username");
    String pass=request.getParameter("password");
    session.setAttribute("username",ename);
    session.setAttribute("password",pass);
    
    Loginbean loginBean=new Loginbean();
    loginBean.setUsername(ename);
    loginBean.setPassword(pass);
   int id=LoginDao. returnId(loginBean);
   session.setAttribute("uid",id);
   String role= LoginDao.check(loginBean);
   if(role.equals("admin")){
	   
	   response.sendRedirect("adminHome.jsp");
   }
   else if(role.equals("employee")){
	
	   response.sendRedirect("employeHome.jsp");
   }
   else{
	  %><script>vali();</script><%} %>
	      