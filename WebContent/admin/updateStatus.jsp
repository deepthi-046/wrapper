<%--
author:TechTycoons
document:status update
created:17-11-2019


--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@ page import="Dao.TrackingDao"%>
<%@ page import="beans.TrackingBean"%>
 <%@include file="header1.html" %>
<% 
String Name = (String)session.getAttribute("username");
if(Name==null){
response.sendRedirect("login.html");
}
Integer cid = Integer.parseInt(request.getParameter("cid"));
Integer oid = Integer.parseInt(request.getParameter("oid"));


TrackingBean trackingBean = new TrackingBean();
trackingBean.setCid(cid);
trackingBean.setOid(oid);
session.setAttribute("oid",oid);
//TrackingDao.InsertIntoDB(trackingBean);

%>
<form name="update" method="post" action="updateAction.jsp">
Status:<input type="text" name="status" placeholder="enter status" required>
<input type="hidden" name="oid" value=<%=oid %> required>
<input type="submit" value="update">
</form>
