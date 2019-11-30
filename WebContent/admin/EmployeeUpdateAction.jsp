<%--
author:TechTycoons
document:employeeUpdateAction
created:17-11-2019


--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="beans.Loginbean"%>
<%@page import="Dao.LoginDao"%>
<%@include file="header.html"%>

<%
String Name = (String)session.getAttribute("username");
if(Name==null){
response.sendRedirect("login.html");
}
	String username = request.getParameter("ename");

	String id = request.getParameter("id");
	int iId = Integer.parseInt(id.trim());

	String location = request.getParameter("location");
	//System.out.println(username);

	//System.out.println(location);
	Loginbean loginBean = new Loginbean();
	loginBean.setUsername(username);

	loginBean.setLocation(location);
	loginBean.setUid(iId);

	boolean flag = LoginDao.employeeUpdate(loginBean);
	if (flag == true) {
		response.sendRedirect("employeeView.jsp");
	} else {

		out.println("error occured");
	}
%>