<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>GAPP Student</title>
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
	text-align: center;
	font-size: 20px;
	background-color: #CC3333;
	color: white;
}

h3 {
	font-size: 30px
}

td {
	font-size: 17px;
}

.panel-heading {
	color: #990033;
}

.myButton {
	-moz-box-shadow: 0px 10px 14px -7px #3e7327;
	-webkit-box-shadow: 0px 10px 14px -7px #3e7327;
	box-shadow: 0px 10px 14px -7px #3e7327;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #77b55a), color-stop(1, #72b352));
	background:-moz-linear-gradient(top, #77b55a 5%, #72b352 100%);
	background:-webkit-linear-gradient(top, #77b55a 5%, #72b352 100%);
	background:-o-linear-gradient(top, #77b55a 5%, #72b352 100%);
	background:-ms-linear-gradient(top, #77b55a 5%, #72b352 100%);
	background:linear-gradient(to bottom, #77b55a 5%, #72b352 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#77b55a', endColorstr='#72b352',GradientType=0);
	background-color:#77b55a;
	-moz-border-radius:8px;
	-webkit-border-radius:8px;
	border-radius:8px;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:20px;
	font-weight:bold;
	padding:13px 32px;
	text-decoration:none;
	text-shadow:0px 1px 0px #5b8a3c;
}

.myButton2 {
	-moz-box-shadow: 0px 10px 14px -7px #8a2a21;
	-webkit-box-shadow: 0px 10px 14px -7px #8a2a21;
	box-shadow: 0px 10px 14px -7px #8a2a21;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #c62d1f), color-stop(1, #f24437));
	background:-moz-linear-gradient(top, #c62d1f 5%, #f24437 100%);
	background:-webkit-linear-gradient(top, #c62d1f 5%, #f24437 100%);
	background:-o-linear-gradient(top, #c62d1f 5%, #f24437 100%);
	background:-ms-linear-gradient(top, #c62d1f 5%, #f24437 100%);
	background:linear-gradient(to bottom, #c62d1f 5%, #f24437 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#c62d1f', endColorstr='#f24437',GradientType=0);
	background-color:#c62d1f;
	-moz-border-radius:8px;
	-webkit-border-radius:8px;
	border-radius:8px;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:20px;
	font-weight:bold;
	padding:13px 32px;
	text-decoration:none;
	text-shadow:0px 1px 0px #810e05;
}
</style>
</head>
<body background="images/img6.jpg">
	<div class="container">
		<div class="row">
			<div class="jumbotron myBackground">
				<h1 align="center">
					<b>Hello ${user.getFirstName() }! </b>
				</h1>
				<a href="logout.html" class="myButton2 pull-right"><span
					class="glyphicon glyphicon-log-out"></span> Logout</a><br /><br />
			</div>

			<div class="panel myBackground">
				<div class="panel-heading">
					<h3 align="center">
						<b>List of Applications</b>
					</h3>
				</div>
				<br /> <br />
				
				<center>
					<a href="app/apply.html?id=${user.id}"
						class="myButton" style="margin-right: 30px"><span
						class="glyphicon glyphicon-plus"></span> New Application</a>

				</center>
				<br />

				<c:if test="${fn:length(applications) eq 0 }">
					<h2 align="center">
						<b>Currently No Applications!</b>
					</h2>

				</c:if>

				<c:if test="${fn:length(applications) ne 0 }">
					<div class="row">
						<div class="container">

							<table border="2" class="table">
								<tbody align="center">
									<tr>
										<th>Application No.</th>
										<th>Department</th>
										<th>Program</th>
										<th>Term</th>
										<th>Current Status</th>
										<th>Date Submitted</th>
										<th>Operations</th>



									</tr>

									<c:forEach items="${applications}" var="app" varStatus="number">
										<tr class="active">
											<td>${number.count}</td>
											<c:set var="prg" value="${app.programs }" />
											<c:set var="dept" value="${prg.departments }" />
											<td>${dept.departmentName}<br />
											</td>

											<td>${prg.programName}<br />
											</td>
											<td>${app.term }</td>
											<td>${app.status}</td>
											<td><fmt:formatDate value="${app.submitDate}"
													pattern="M/d/yyyy" /></td>
											<td><a
												href="app/appview.html?appid=${app.id}&deptid=${dept.id}">Details</a>
												<c:choose>
													<c:when test="${app.status=='Not Submitted' }">
														| <a
															href="app/editApp.html?appid=${app.id}&deptid=${dept.id}">Edit</a>
													</c:when>
													<c:otherwise>

													</c:otherwise>
												</c:choose></td>

										</tr>

									</c:forEach>

								</tbody>
							</table>
						</div>
					</div>

				</c:if>

			</div>

		</div>
	</div>

</body>
</html>