<%--
author:TechTycoons
document:employeeUpdate
created:17-11-2019


--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="header.html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Wrapper hero</title>
</head>
<body>
	<%
	String Name = (String)session.getAttribute("username");
	  if(Name==null){
	 response.sendRedirect("login.html");
	  }
		String id = request.getParameter("id");
		String ename = request.getParameter("username");
		String location = request.getParameter("location");
		int iId = Integer.parseInt(id.trim());
	%>

	<form method="post" action="EmployeeUpdateAction.jsp">
		<table>
			<tr>
				<td><input type="hidden" name="id" value=<%=iId%>></td>
			</tr>
			<br>
			<br>
			<tr>
				<td>username:<input type="text" name="ename" value=<%=ename%>></td>
			</tr>
			<br>
			<br>

			<tr>
				<td>location:<input type="text" name="location"
					value=<%=location%>></td>
			</tr>
			<br>
			<br>

			<tr>
				<td><input type="submit" name="submit" value="update"></td>
			</tr>


		</table>
	</form>
</body>
</html>