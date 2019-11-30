<%-- 
    Document   : allot orders 
    Created on : 15-11-2019
    Author     : techtycoons
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="Dao.LoginDao" %>
<%@ page import="Dao.notificationsDao" %>
<%@include file ="header.html" %>
<%@ page import="beans.Loginbean" %>
<%@ page import="beans.notifications" %>
<%@ page import="java.util.ArrayList" %>
<%
String Name = (String)session.getAttribute("username");
if(Name==null){
response.sendRedirect("login.html");
}
ArrayList<notifications> e=notificationsDao.allotOrder();

notifications noti=new notifications();

 		int size=0;
 		size=e.size();
      if(size==0){%>
    	  <h3 align="center">NO ORDER TO SHOWN</h3>
      <% }else{%>
      	
         <table width="500" border="1"  align="center">
	<h2 align="center">ALLOT ORDERS TO EMPLOYEES</h2>
<tr>
	<td align="center">Sl.No</td>
	
	<td align="center">Item Name</td>	
		<td align="center">Date</td> 
     <td align="center">Customer Name</td> 
      <td align="center">Destination</td> 
    	      <td align="center">Allot Employee</td> 
    	
	
</tr>
      <% 
 		int i=0;
      
 			for(notifications it:e){
				i=i+1;
 			int oid=it.getO_id();
 			int cid=it.getCid();
 			//session.setAttribute("oid",oid);
 			//session.setAttribute("cid",cid);
                %>
 
 
    <tr><td width="12" height="20" align="center"><span style="font-size: 14"><%=i%></span></td>
	<td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.getOname()%> </span></div></td>
	<td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.getDate()%></span></div></td>
	<td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.getCname()%></span></div></td>
	<td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.getCdestination()%></span></div></td>
	<td width="43" align="center"><div align="center" ><span style="font-size: 14"><a href='allotEmployee.jsp?dest=<%=it.getCdestination()%>&oid=<%=it.getO_id()%>&cid=<%=it.getCid()%>'>ALLOT EMPLOYEES</a></span></div></td>
	 	
	</tr>
  
  <%  }}%>

</table>