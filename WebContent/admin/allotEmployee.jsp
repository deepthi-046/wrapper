<%-- 
    Document   :alloting employees
    Created on : 29-10-2019
    Author     : TechTycoons
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="Dao.LoginDao"%>
<%@ page import="beans.Loginbean"%>
<%@ page import="Dao.notificationsDao" %>
<%@include file ="header.html" %>
<%@ page import="beans.notifications"%>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String Name = (String)session.getAttribute("username");
if(Name==null){
response.sendRedirect("login.html");
}
	String dest = request.getParameter("dest");
String oid = request.getParameter("oid");
String cid = request.getParameter("cid");
 int cId = Integer.parseInt(cid.trim());
 int oId = Integer.parseInt(oid.trim());
 session.setAttribute("oid",oId);
	session.setAttribute("cid",cId);
	Loginbean log = new Loginbean();
	log.setLocation(dest);
	/*log.setcId(cId);
	log.setoId(oId);*/
ArrayList<Loginbean> e=notificationsDao.destinationView(dest);

	
	
	 		int size=0;
	 		size=e.size();
	      if(size==0){%>
	    	  <h3 align="center">NO ORDER TO SHOWN</h3>
	      <% }else{%>
	      	
	         <table width="500" border="1"  align="center">
		<h2 align="center">ALLOT ORDERS TO EMPLOYEES</h2>
	<tr>
		<td align="center">Sl.No</td>
		
		<td align="center">Employee Name</td>	
			
	    	      <td align="center">Actions</td> 
	    	
		
	</tr>
	      <% 
	 		int i=0;
	      
	 			for(Loginbean it:e){
					i=i+1;
	 				//int uid=it.getUid();
	 				//session.setAttribute("uid",uid);
	  
	                %>
	 
	 
	    <tr><td width="12" height="20" align="center"><span style="font-size: 14"><%=i%></span></td>
		<td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.getUsername()%> </span></div></td>
		 		 	<td width="43" align="center"><div align="center" ><span style="font-size: 14"><a href='allot.jsp?id=<%=it.getUid()%>'>ALLOT</a></span></div></td>
		 	
		</tr>
	  
	  <%  }}out.print("<a href='sendMessage.jsp'>Back to Home</a>");%>

	</table>
