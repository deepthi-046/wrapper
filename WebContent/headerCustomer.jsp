<%--
author:TechTycoons
document:Feedback
created:30-10-2019
author:angel

--%>
<%String Name = (String)session.getAttribute("customername");
if(Name==null){
response.sendRedirect("index.html");
} %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>header part</title>
<link rel="stylesheet" href="css/headerstyle.css">
</head>
<body>
<div class="topnav">
  <a class="active" href="#home">WRAPPER HERO</a>
  <a href="myProfile.jsp">My Profile</a>
  <a href="myOrder.jsp">My Order</a>
  <a href="track.jsp">Tracking</a>
  <a href="feedback.jsp">Feedback</a>
  <a href="logOut.jsp">Logout</a>
  
   <%
  //Checking session if not exists redirect to index.html
  
  String customerName = (String)session.getAttribute("customername");
  
  //session.setAttribute("cuname",customerName);
  
  if(customerName==null){
	  response.sendRedirect("index.html");
  }
  %>
  
</div>
</body>
</html>