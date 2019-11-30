<%--
author:TechTycoons
document:Tracking
created:30-10-2019


--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	    <%@include file="headerCustomer.jsp" %>
	
<!DOCTYPE html>
<html>
<head>

<title></title>
</head>
<body>
<html>
<head>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<!------ Include the above in your HEAD tag ---------->


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="row shop-tracking-status">

		<div class="col-md-12">
			<div class="well">

				<div class="form-horizontal">
					<div class="form-group">
						<label for="inputOrderTrackingID" class="col-sm-2 control-label">Order
							id</label>
						<div class="col-sm-10">
							<form name="demo" method="post" action="trackAction.jsp">
								<input type="number" name="oid" class="form-control"
									id="inputOrderTrackingID" value=""
									placeholder="# put your order id here">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="submit" value="Track" id="shopGetOrderStatusID"
								class="btn btn-success">
							</form>
						</div>
					</div>
				</div>
</body>
</html>


