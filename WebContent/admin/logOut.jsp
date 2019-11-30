<%--
author:TechTycoons
document:logout
created:17-11-2019


--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
session=request.getSession(); 
session.invalidate(); 
session=null;
boolean flag=true;
if(flag==true){
    
  
  response.sendRedirect("login.html");
}
else {
  
  out.println("error");
}

%>