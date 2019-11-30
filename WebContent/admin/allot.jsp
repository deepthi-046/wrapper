<%-- 
    Document   : alloting orders
    Created on : 13-11-2019
    Author     : Techtycoons
--%>
    
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="Dao.LoginDao"%>
<%@ page import="Dao.notificationsDao"%>
<%@ page import="beans.Loginbean"%>
<%@ page import="beans.notifications"%>
<%@ page import="java.util.ArrayList"%>
<%@include file ="header.html" %>
<%
String Name = (String)session.getAttribute("username");
if(Name==null){
response.sendRedirect("login.html");
}
	String id = request.getParameter("id");
	int iId = Integer.parseInt(id.trim());
	Integer cId=(Integer)session.getAttribute("cid");
	Integer oId=(Integer)session.getAttribute("oid");

	notifications noti=new notifications();
	noti.setuId(iId);
	noti.setO_id(oId);
	noti.setCid(cId);
	boolean f=notificationsDao.allotemployee(noti);

	if(f){
		response.sendRedirect("allotOrder.jsp");
	}
	else
		response.sendRedirect("error.jsp");
%>