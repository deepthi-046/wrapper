<%--
author:TechTycoons
document:customerlist
created:17-11-2019


--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@ page import="Dao.LoginDao"%>
<%@ page import="Dao.notificationsDao"%>
<%@ page import="Dao.TrackingDao"%>
<%@ page import="beans.Loginbean"%>
<%@ page import="beans.notifications"%>
<%@ page import="beans.TrackingBean"%>
<%@ page import="java.util.ArrayList"%>
 <%@include file="header1.html" %>
<%
String Name = (String)session.getAttribute("username");
if(Name==null){
response.sendRedirect("login.html");
}
	Integer id =(Integer)session.getAttribute("eid");
	notifications noti = new notifications();
	noti.setuId(id);
	ArrayList<notifications> customerID = notificationsDao.getCustomerID(id);
	%>
	<table width="500" border="1" align="center">
	<h2 align="center">CUSTOMERS LIST</h2>
	<tr>
		<td align="center">Sl.No</td>

		<td align="center">CUSTOMER NAME</td>
		<td align="center">ACTIONS</td>


	</tr>
	<%
	int i = 0;

	for (notifications nb :customerID ) {
	noti.setCid(nb.getCid());
	i = i + 1;
	//session.setAttribute("cid",customerID);
	//out.println(customerID);
	ArrayList<notifications> e = notificationsDao.viewcustomers(noti);
	int size = 0;
	size = e.size();
	if (size == 0) {
%>
<h3 align="center">NO DATA TO SHOWN</h3>
<%
	} else {
%>


	<%
		
			for (notifications it : e) {
				
				session.setAttribute("oid",it.getO_id());
				session.setAttribute("cid",it.getCid());
				Integer oid=it.getO_id();
				Integer cid=it.getCid();
				TrackingBean trackingBean=new TrackingBean();
				//TrackingDao.InsertIntoDB(trackingBean);
	%>


	<tr>
		<td width="12" height="20" align="center"><span
			style="font-size: 14"><%=i%></span></td>

		<td width="43" align="center"><div align="center">
				<span style="font-size: 14"><%=it.getCname()%></span>
			</div></td>

		<td width="43" align="center"><div align="center">
				<span style="font-size: 14"><a href='updateStatus.jsp?oid=<%=it.getO_id()%>&cid=<%=it.getCid()%>'>Update status</a></span>
			</div></td>

	</tr>

	<%
			}
		}
		}
		
	%>

</table>

