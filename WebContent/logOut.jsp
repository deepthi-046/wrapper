<%--
document:Signout
created:16-11-2019
author:TechTycoons

--%>




<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
session=request.getSession(); 
session.invalidate(); 
session=null;
boolean flag=true;
if(flag==true){
    
  
  response.sendRedirect("index.html");
}
else {
  
  out.println("error");
}

%>