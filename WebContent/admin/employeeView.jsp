<%--
author:TechTycoons
document:view employees
created:17-11-2019


--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="Dao.LoginDao"%>
<%@ page import="Dao.notificationsDao"%>
<%@include file="header.html"%>
<%@ page import="beans.Loginbean"%>
<%@ page import="beans.notifications"%>
<%@ page import="java.util.ArrayList"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="viewEmployeeStyle.css">
<meta charset="ISO-8859-1">
<title>Employee List</title>
</head>
<body class="secStyle">
	<ul style="background-image: pic2.jpeg">

	</ul>
	<br>

	<%
	String Name = (String)session.getAttribute("username");
	  if(Name==null){
	 response.sendRedirect("login.html");
	  }
		ArrayList<Loginbean> lb = LoginDao.viewEmployeeList();
		Loginbean loginbean = new Loginbean();

		int size = 0;
		size = lb.size();
		if (size == 0) {
	%>
	<h3 align="center">NO DATA TO SHOWN</h3>
	<%
		} else {
	%>

	<table width="500" border="1" align="center">
		<h2 align="center">EMPLOYEE LIST</h2>
		<tr>
			<td align="center">Sl.No</td>

			<td align="center">Employee Name</td>
			<td align="center">Employee password</td>
			<td align="center">Employee role</td>
			<td align="center">Employee location</td>

			<td align="center">ACTIONS</td>


		</tr>
		<%
			int i = 0;

				for (Loginbean it : lb) {
					i = i + 1;
					String uname = it.getUsername();
					String location = it.getLocation();
		%>


		<tr>
			<td width="12" height="20" align="center"><span
				style="font-size: 14"><%=i%></span></td>
			<td width="43" align="center"><div align="center">
					<span style="font-size: 14"><%=it.getUsername()%> </span>
				</div></td>
			<td width="43" align="center"><div align="center">
					<span style="font-size: 14"><%=it.getPassword()%></span>
				</div></td>
			<td width="43" align="center"><div align="center">
					<span style="font-size: 14"><%=it.getRole()%></span>
				</div></td>
			<td width="43" align="center"><div align="center">
					<span style="font-size: 14"><%=it.getLocation()%></span>
				</div></td>

			<td width="43" align="center"><div align="center">
					<span style="font-size: 14"><a
						href='employeeUpdate.jsp?id=<%=it.getUid()%>&location=<%=it.getLocation()%>&username=<%=it.getUsername()%>'>EDIT</a></span>
				</div></td>
			<td width="43" align="center"><div align="center">
					<span style="font-size: 14"><a
						href='employeedeleteAction.jsp?username=<%=it.getUsername()%>'>DELETE</a></span>
				</div></td>

		</tr>

		<%
			}
			}
		%>

	</table>
</body>
</html>
