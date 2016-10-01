<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Details</title>
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
	font-size: 30px;
}

td {
	font-size: 17px;
}
.panel-heading {
	color: #990033;
}
</style>
</head>
<body background = "/gapp/images/img6.jpg">
	<div class="container">
		<div class="row">
			<div class="jumbotron myBackground">
				<h1 align="center">
					<b>GAPP Administrator</b>
				</h1>
				<a href="/gapp/admin.html" class="btn btn-info pull-right btn-lg"><span
					class="glyphicon glyphicon-arrow-left"></span> Back</a>
			</div>
			<div class="panel myBackground">
				<div class="panel-heading">
					<h3 align="center"><b>Department Details</b></h3>
				</div>
				<br /> <br />
				<div class="row">

					<div class="col-md-offset-1 col-md-10">
						<table border="2" class="table table-hover">
							<tbody>
								<tr bgcolor="#C8C8C8">
									<th>Department Name</th>
									<th>Program Name</th>
									<th>Additional Requirements</th>

								</tr>
								<tr class = "active">
									<td>${dept.departmentName}</td>

									<td><c:forEach items="${prog}" var="prg"
											varStatus="theCount">
											${theCount.count}. ${prg.programName}<br />
										</c:forEach></td>
									<td><c:forEach items="${addinfo}" var="info"
											varStatus="theCount">
											${theCount.count}. ${info.fieldName}<br />
										</c:forEach></td>
								</tr>
								<tr class="active">
									<td colspan="4" style="text-align: center;"><a
										href="dept/addProg.html?id=${id}" class="btn btn-danger btn-lg"
										style="margin-right: 30px"><span
											class="glyphicon glyphicon-plus"></span> Add Program</a> <a
										href="dept/addInfo.html?id=${id}" class="btn btn-danger btn-lg"><span
											class="glyphicon glyphicon-plus"></span> Add Additional
										Requirement</a></td>

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