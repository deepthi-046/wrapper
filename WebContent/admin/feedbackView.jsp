<%--
author:TechTycoons
document:Feedback
created:16-11-2019

--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="Dao.notificationsDao"%>
<%@page import="beans.notifications"%>
<%@page import="java.util.ArrayList"%>

<%@ include file="header.html" %>


<%
	//out.print(cname + pwd);
String Name = (String)session.getAttribute("username");
if(Name==null){
response.sendRedirect("login.html");
}
	ArrayList<notifications> lst = notificationsDao.displayfeedback();
	notifications noti = new notifications();
%>
<body>

	<table id="view">
		<tr>
			<th class="vth">Sl.NO</th>
			<th class="vth">Comment</th>
			<th class="vth">Date</th>


		</tr>
		<%
			int i = 1;
			for (notifications obj : lst) {
		%>
		<tr>
			<td class="vtd"><%=i%></td>
			<td class="vtd"><%=obj.getComment()%></td>
			<td class="vtd"><%=obj.getDate()%></td>
			
			


		</tr>
		<%
			i = i + 1;
			}
		%>
	</table>
</body>
</html>
<!DOCTYPE html>
<html>
<head>
<style>
table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  text-align: left;
  padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}

th {
  background-color: #4CAF50;
  color: white;
}
</style>
</head>
<body>
