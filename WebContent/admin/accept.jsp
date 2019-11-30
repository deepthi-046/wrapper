<%-- 
    Document   : update status 
    Created on : 16-11-2019
    Author     : techtycoons
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="Dao.LoginDao"%>
<%@ page import="Dao.notificationsDao"%>
<%@include file ="header.html" %>
<%@ page import="beans.Loginbean"%>
<%@ page import="beans.notifications"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String Name = (String)session.getAttribute("username");
if(Name==null){
response.sendRedirect("login.html");
}
	String id = request.getParameter("id");
	int iId = Integer.parseInt(id);
	notifications noti = new notifications();
	noti.setO_id(iId);
	boolean f = notificationsDao.update(noti);
	if (f) {
		response.sendRedirect("viewNotifications.jsp");
	} else
		out.println("error");
%>