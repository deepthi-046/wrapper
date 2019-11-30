<%--
author:TechTycoons
document:update
created:17-11-2019


--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@ page import="Dao.TrackingDao"%>
<%@ page import="beans.TrackingBean"%>
<% 
String Name = (String)session.getAttribute("username");
if(Name==null){
response.sendRedirect("login.html");
}
String status=request.getParameter("status");

Integer oid = Integer.parseInt(request.getParameter("oid"));

TrackingBean trackingbean = new TrackingBean();
trackingbean.setOid(oid);
trackingbean.setStatus(status);
TrackingDao.updateStatus(trackingbean);

response.sendRedirect("employeHome.jsp");
%>