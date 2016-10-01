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
<title>GAPP Department</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="jumbotron">
				<h1 align="center">GAPP Administrator</h1>
				<a href="/gapp/admin.html" class="btn btn-primary pull-right">Back</a>
			</div>
			<div class="panel panel-info">
			<div class="panel-heading"><h3 align = "center">Department Management</h3></div><br/> <br/>
			<div class="row">
				<div class="col-md-offset-2 col-md-8">
					
					<table border="2" class="table table-striped">
						<tbody>
							<tr>
								<th><font size="2">Department ID</font></th>
								<th><font size="2">Department Name</font></th>
								<th><font size="2">No. of Programs</font></th>
								<th><font size="2">Operations</font></th>

							</tr>

							<c:forEach items="${departments}" var="dept">
								<tr>
									<td>${dept.id}</td>
									<td>${dept.departmentName}</td>
									<td>${fn:length(dept.programs) }</td>
									<td><a href="${dept.id }.html">Details</a> | <a
										href="edit.html?id=${dept.id}">Edit</a></td>
								</tr>
							</c:forEach>
							<tr>
								<td colspan="4" scope="row" style="text-align: center;">
								<a href="dept/addDept.html" class="btn btn-success">Add Department</a></td>
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