<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>GAPP Administrator</title>
<style>
body {
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
	font-family: "Georgia", serif;
	font-weight: bold;
}
.myBackground {
	background-color: rgba(255, 255, 255, 0.5);
	color: inherit;
}
th {
	font-size: 20px;
}
h3 {
	font-size:30px
}
td {
	font-size:17px;
}
.panel-heading {
	color: #990033;
}
</style>
</head>
<body background="images/img6.jpg">
	<div class="container">
		<div class="row">
			<div class="jumbotron myBackground">
				<h1 align="center">
					<b>GAPP Administrator</b>
				</h1>
				<a href="logout.html" class="btn btn-danger pull-right btn-lg" ><span
					class="glyphicon glyphicon-log-out"></span> Logout</a>
			</div>
			
			<div class="panel myBackground">
				<div class="panel-heading">
				<center><h2><b>Hello ${user.getFirstName() }! </b></h2></center>
					<h3 align="center">
						<b>Department Management</b>
					</h3>
				</div>
				<br /> <br />
				<div class="row">
					<div class="col-md-offset-2 col-md-8">

						<table border="2" class="table table-hover">
							<tbody align="center">
								<tr bgcolor="#C8C8C8">
									<th>Department Name</th>
									<th>No. of Programs</th>
									<th>Operations</th>

								</tr>

								<c:forEach items="${departments}" var="dept">
									<tr class="active">
										<td>${dept.departmentName}</td>
										<td>${fn:length(dept.programs) }</td>
										<td><a href="${dept.id }.html">Details</a> | <a
											href="dept/editDept.html?id=${dept.id}">Edit</a></td>
									</tr>
								</c:forEach>
								<tr class="active">
									<td colspan="4" scope="row" style="text-align: center;"><a
										href="dept/addDept.html" class="btn btn-danger btn-lg"><span
											class="glyphicon glyphicon-plus"></span>Add Department</a></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>