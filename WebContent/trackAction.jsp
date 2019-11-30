<%--
author:TechTycoons
document:tracking
created:16-11-2019


--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="beans.TrackingBean" %>
<%@page import="Dao.TrackingDao" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="sta.css" rel="stylesheet" id="bootstrap-css">
</head>
<body>
<% int oid=Integer.parseInt(request.getParameter("oid"));
session.setAttribute("oid", oid);
TrackingBean trackingBean=new TrackingBean ();
trackingBean.setOid(oid);

int id=TrackingDao.checkID(trackingBean);
if(id==oid){
String status= TrackingDao.check(trackingBean);

if(status.equals("Accepted")){
   %>
   <ol class="progtrckr" data-progtrckr-steps="5">
    <li class="progtrckr-done">Confirm order</li><!--
 --><li class="progtrckr-done">Accepted</li><!--
 --><li class="progtrckr-todo">Packed</li><!--
 --><li class="progtrckr-todo">Shipped</li><!--
 --><li class="progtrckr-todo">Delivered</li>
</ol><%
 
}
else if(status.equals("Packed")){
  %>
  <ol class="progtrckr" data-progtrckr-steps="5">
   <li class="progtrckr-done">Confirm order</li><!--
--><li class="progtrckr-done">Accepted</li><!--
--><li class="progtrckr-done">Packed</li><!--
--><li class="progtrckr-todo">Shipped</li><!--
--><li class="progtrckr-todo">Delivered</li>
</ol><%
 
}
else if(status.equals("Shipped")){
  %>
  <ol class="progtrckr" data-progtrckr-steps="5">
   <li class="progtrckr-done">Confirm order</li><!--
--><li class="progtrckr-done">Accepted</li><!--
--><li class="progtrckr-done">Packed</li><!--
--><li class="progtrckr-done">Shipped</li><!--
--><li class="progtrckr-todo">Delivered</li>
</ol><%
 
}
else if(status.equals("Delivered")){
  %>
  <ol class="progtrckr" data-progtrckr-steps="5">
   <li class="progtrckr-done">Confirm order</li><!--
--><li class="progtrckr-done">Accepted</li><!--
--><li class="progtrckr-done">Packed</li><!--
--><li class="progtrckr-done">Shipped</li><!--
--><li class="progtrckr-done">Delivered</li>
</ol><%
 
}
else{
  %>
  <ol class="progtrckr" data-progtrckr-steps="5">
   <li class="progtrckr-done">Confirm order</li><!--
--><li class="progtrckr-todo">Accepted</li><!--
--><li class="progtrckr-todo">Packed</li><!--
--><li class="progtrckr-todo">Shipped</li><!--
--><li class="progtrckr-todo">Delivered</li>
</ol><%
 
}
}

%><%

else{
out.println("Enter valid ID");
}

%>
</body>
</html>
</html>