<%--
author:TechTycoons
document:changepassword
created:17-11-2019


--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@include file="header1.html" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String Name = (String)session.getAttribute("username");
if(Name==null){
response.sendRedirect("login.html");
}
String password=(String)session.getAttribute("pass");
String username=(String)session.getAttribute("name");
%>
<form method="post" action="passwordchangeAction.jsp">
<table>
<tr><td><input type="hidden" name="uname" value="<%=username%>"/></td></tr>
<tr><td>OldPassword:<input type="text" name="pass" value="<%=password%>"/></td></tr>

<tr><td>desired password:<input type="password" name="password"/></td></tr>
<tr><td><input type="submit" name="submit" value="change" /></td></tr>


</table>
</form>


</body>
</html>