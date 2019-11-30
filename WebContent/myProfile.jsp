<%--
document:User
created:16-11-2019
author:techtycoons
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@page import="beans.Loginbean"%>
<%@page import="Dao.LoginDao"%>
<%@ page import="java.util.ArrayList"%>
<%@ include file="headerCustomer.jsp"%>
<%

	String uname =(String)session.getAttribute("cuname");
	//String pass = request.getParameter("pass");
	//String name = request.getParameter("name");
	/*String id=request.getParameter("cid");
	Integer cid=Integer.parseInt(id.trim());*/
	//String address=request.getParameter("address");
	Loginbean eq = new Loginbean();
	eq.setCustomerName(uname);
	

	ArrayList<Loginbean> eb = LoginDao.view(uname);
	int size = 0;
	size = eb.size();
	if (size == 0) {
%>
<h1>NO DATA TO SHOWN</h1>
<%
	} else {
%>
<table width="0" border="0" align="center">

	<tr>
		<td align="center">id</td>

		<td align="center">Username</td>

		<td align="center">Name</td>
		<td align="center">Password</td>
		<td align="center">Address</td>

	</tr>
	<%
		int i = 0;

			for (Loginbean it : eb) {

				i = i + 1;
	%>


	<tr>
		<td width="0" height="20" align="center"><span
			style="font-size: 14"><%=i%></span></td>
		<td width="0" align="center"><div align="center">
				<span style="font-size: 14"><%=it.getUsername()%> </span>
			</div></td>
		<td width="0" align="center"><div align="center">
				<span style="font-size: 14"><%=it.getCustomerName()%> </span>
			</div></td>
		<td width="0" align="center"><div align="center">
				<span style="font-size: 14"><%=it.getPassword()%></span>
			</div></td>
		<td width="0" align="center"><div align="center">
				<span style="font-size: 14"><%=it.getAddress()%></span>
			</div></td>

		<%
			}
			}
		%>
	</tr>
</table>
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

tr:nth-child(even) {
	background-color: #f2f2f2
}

th {
	background-color: #4CAF50;
	color: white;
}
</style>
</head>
<body>