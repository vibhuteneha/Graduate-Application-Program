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
	text-align: center;
	font-size: 20px;
	background-color: #CC3333;
	color: white;
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
<body background="/gapp/images/img6.jpg">
	<div class="container">
		<div class="row">
			<div class="jumbotron myBackground">
				<h1 align="center">
					<b>Application Details</b>
				</h1>
				<a href="/gapp/student.html?id=${applications.applicant.id}"
					class="btn btn-info pull-right btn-lg" ><span
					class="glyphicon glyphicon-arrow-left"></span> Back</a>
			</div>
			<div class="panel myBackground">
				<div class="panel-heading">
					<h3 align="center">
						<b>Department Info</b>
					</h3>
				</div>
				<br /> <br />
				<div class="row">

					<div class="col-md-offset-2 col-md-8">
						<table border="2" class="table">
							<tr>
								<th>Department</th>
								<th>Program</th>
								<th>Term</th>

							</tr>

							<tbody align="center">
								<tr class="active">
									<td>${applications.programs.departments.departmentName}</td>
									<td>${applications.programs.programName}</td>
									<td>${applications.term}</td>

								</tr>
							</tbody>
						</table>


					</div>
				</div>
			</div>
			<div class="panel myBackground">
				<div class="panel-heading">
					<h3 align="center">
						<b>Basic User Info</b>
					</h3>
				</div>
				<br /> <br />
				<div class="row">

					<div class="container">
						<table border="2" class="table">
							<tbody align="center">
								<tr>
									<th>First Name</th>
									<th>Last Name</th>
									<th>CIN</th>
									<th>Phone No.</th>
									<th>Email-ID</th>
									<th>Gender</th>
									<th>Date of Birth</th>
									<th>Citizenship</th>

								</tr>
								<tr class="active">
									<td>${applications.firstName}</td>
									<td>${applications.lastName}</td>
									<td>${applications.cin}</td>
									<td>${applications.phone}</td>
									<td>${applications.email}</td>
									<td>${applications.gender}</td>
									<td>${applications.dob}</td>
									<td>${applications.citizenship}</td>

								</tr>
							</tbody>
						</table>


					</div>
				</div>
			</div>
			<div class="panel myBackground">
				<div class="panel-heading">
					<h3 align="center">
						<b>Educational Background</b>
					</h3>
				</div>
				<br /> <br />
				<div class="row">

					<div class="container">
						<c:if test="${fn:length(applications.degrees) ne 0 }">
							<table border="2" class="table">
								<tbody align="center">
									<tr>
										<th>University Name</th>
										<th>Time Period</th>
										<th>Degree Earned</th>
										<th>Major</th>
									</tr>
									<c:forEach items="${applications.degrees}" var="deg">
										<tr class="active">

											<td>${deg.schoolName}</td>
											<td>${deg.timePeriod}</td>
											<td>${deg.degreeEarned}</td>
											<td>${deg.major}</td>


										</tr>
									</c:forEach>
								</tbody>
							</table>
						</c:if>
						<c:if test="${fn:length(applications.degrees) eq 0 }">

							<h3 align="center">
								<b>No Educational Information to Display!</b>
							</h3>
						</c:if>
					</div>
				</div>
			</div>
			<div class="panel myBackground">
				<div class="panel-heading">
					<h3 align="center">
						<b>Academic Records</b>
					</h3>
				</div>
				<br /> <br />
				<div class="row">

					<div class="container">
						<table border="2" class="table">
							<tbody align="center">
								<tr>
									<th>TOEFL Score</th>
									<th>GRE Score</th>
									<th>GPA</th>
									<c:if test="${fn:length(addinfo) ne 0 }">
										<th><c:forEach items="${addinfo}" var="info">
											 ${info.fieldName}
										</c:forEach></th>
									</c:if>
									<th>Transcripts</th>


								</tr>

								<tr class="active">

									<td>${applications.toefl}</td>
									<td>${applications.gre}</td>
									<td>${applications.gpa}</td>
									<c:if test="${fn:length(addinfo) ne 0 }">
										<td><c:forEach items="${addinfo}" var="info">
											 ${info.fieldValue}
										</c:forEach></td>
									</c:if>
									<td><c:if test="${NULL!=applications.transcripts.id}">
											<a href="download.html?fileid=${applications.transcripts.id}"
												class="btn btn-success"><b><span
													class="glyphicon glyphicon-download"></span> Download File</b></a>
										</c:if></td>
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