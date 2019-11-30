<%--
author:TechTycoons
document:Myorders
created:30-10-2019


--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="Dao.LoginDao"%>
<%@page import="beans.Loginbean"%>
<%@page import="java.util.ArrayList"%>

<%@ include file="headerCustomer.jsp" %>


<%
	String cname = (String) session.getAttribute("customeruname");
	String pwd = (String) session.getAttribute("password");
	//out.print(cname + pwd);
	Loginbean usr = new Loginbean();
	usr.setUsername(cname);
	usr.setPassword(pwd);
	int cid = LoginDao.getUserId(usr);
	ArrayList<Loginbean> lst = LoginDao.displayPastOrder(cid);
%>
<body>

	<table id="view">
		<tr>
			<th class="vth">Sl.NO</th>
			<th class="vth">OrderDate</th>
			<th class="vth">ItemName</th>


		</tr>
		<%
			int i = 1;
			for (Loginbean obj : lst) {
		%>
		<tr>
			<td class="vtd"><%=i%></td>
			<td class="vtd"><%=obj.getDate()%></td>
			<td class="vtd"><%=obj.getOname()%></td>


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

