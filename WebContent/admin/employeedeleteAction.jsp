<%--
author:TechTycoons
document:employeedelete
created:17-11-2019


--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="beans.Loginbean" %>
<%@page import="Dao.LoginDao" %>
 <%@include file="header.html" %>
<%
String Name = (String)session.getAttribute("username");
if(Name==null){
response.sendRedirect("login.html");
}
    String username=request.getParameter("username");
   
    System.out.println(username);
   
    Loginbean loginBean=new Loginbean();
    loginBean.setUsername(username);
   
    boolean flag=LoginDao.employeeDelete(loginBean);
    if(flag==true){
       
        out.println("sucessfully changed");
    }
    else{
     
     
     out.println("error occured");
    }
   
   
    %>