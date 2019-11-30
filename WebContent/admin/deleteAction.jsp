<%--
author:TechTycoons
document:delete
created:17-11-2019


--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList" %>
     <%@page import="Dao.LoginDao" %>
         <%@page import="beans.Loginbean" %>
              <%@page import="beans.notifications" %>
                   <%@page import="Dao.notificationsDao" %>
              
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String Name = (String)session.getAttribute("username");
if(Name==null){
response.sendRedirect("login.html");
}
	Integer id=(Integer)session.getAttribute("id");
		notifications noti=new notifications();
		noti.setCid(id);
		boolean flag=notificationsDao.deletecustomer(noti);
		if (flag)
			response.sendRedirect("viewCustomer.jsp");
		else
			out.print("*******");
		%>