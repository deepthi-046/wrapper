<%--
author:TechTycoons
document:changepassword
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
    String username=request.getParameter("uname");
    String password=request.getParameter("password");
    Loginbean loginBean=new Loginbean();
    loginBean.setUsername(username);
    loginBean.setPassword(password);
    boolean flag=LoginDao.passwordupdate(loginBean);
    if(flag==true){
       
        //out.println("sucessfully changed");
        response.sendRedirect("login.html");
    }
    else{
     
     
     out.println("error occured");
    }
   
   
    %>