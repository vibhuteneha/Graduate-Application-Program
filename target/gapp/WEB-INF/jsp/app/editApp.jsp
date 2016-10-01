<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Edit Application</title>
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
}

h3 {
	font-size: 30px
}

label {
	font-size: 23px;
}

.panel-heading {
	color: #990033;
}
</style>

<script>
	$(document).ready(function() {
		$.ajax({
			method : "POST",
			url : "editPrograms.html",
			data : {
				departmentID : $("#deptID").val(), programID : $("#progID").val()
			},
			success : function(data) {
				$("#program").html(data);
			}
		});
	});

	function addInput(divName) {
		var newdiv = document.createElement('div');
		newdiv.innerHTML = "<table border='2' class='table'><tr bgcolor='#CC3333'>"
				+ "<th><font color='white'>University Name</font></th>"
				+ "<th><font color='white'>Time Period</font></th>"
				+ "<th><font color='white'>Degree Earned</font></th>"
				+ "<th><font color='white'>Major</font></th>"
				+ "</tr>"
				+ "<tr>"
				+ "<td>"
				+ "<input type='text' class='form-control' name='schoolname' placeholder='University name'/>"
				+ "<br></td>"
				+ "<td><input type='text' class='form-control' name='timeperiod' placeholder='Time Period' required='true'/><br></td>"
				+ "<td><input type='text' class='form-control' name='degreeearned' placeholder='Degree Earned' required='true'/><br/></td>"
				+ "<td><input type='text' class='form-control' name='major' placeholder='Major' required='true'/><br/></td>"
				+ "</tr></table>";
		document.getElementById(divName).appendChild(newdiv);
	}
</script>
</head>
<body background="/gapp/images/img6.jpg">
	<div class="container">
		<div class="jumbotron myBackground">
			<h1 align="center">
				<b>Edit Application</b>
			</h1>
			<a href="/gapp/student.html?id=${application.applicant.id}"
				class="btn btn-info pull-right btn-lg"><span
				class="glyphicon glyphicon-arrow-left"></span> Back</a>

		</div>

		<form:form modelAttribute="application" class="form-inline"
			enctype="multipart/form-data" method="post">

			<div class="panel myBackground">
				<div class="panel-heading">
					<h3 align="center">
						<b>Enter Department Info</b>
					</h3>
				</div>
				<br /> <br />
				<div class="row">
					<div class="col-md-offset-3 col-md-6">
						<div class="from-group">
							<label>Department: </label> <label id="a">
								${departments.departmentName }</label>
							<form:hidden id="deptID" path="programs.departments.id"
								value="${departments.id }"></form:hidden>
						</div>
						<br /> <input type="hidden" id="progID"
							value="${application.programs.getId()}" />
						<div id="program" class="form-group"></div>
						<br /> <br />

						<div class="from-group">
							<label>Term:<font color="red">*</font>:
							</label>
							<form:input type="text" class="form-control input-lg"
								placeholder="eg. Fall 2016" path="term" required="true" />
						</div>
						<br />
					</div>
				</div>
			</div>

			<div class="panel myBackground">
				<div class="panel-heading">
					<h3 align="center">
						<b>Enter Basic Info</b>
					</h3>
				</div>
				<br /> <br />
				<div class="row">
					<div class="col-md-offset-3 col-md-6">
						<table border="2" class="table table-hover">
							<tr>
								<th scope='row' class='active'>First Name<font color="red">*</font>:
								</th>
								<td class="active"><form:input type="text"
										class="form-control input-lg" placeholder="Enter First Name"
										path="firstName" required="true" /></td>
							</tr>

							<tr>
								<th scope='row' class='active'>Last Name<font color="red">*</font>:
								</th>
								<td class="active"><form:input type="text"
										class="form-control input-lg" placeholder="Enter Last Name"
										path="lastName" required="true" /></td>
							</tr>

							<tr>
								<th scope='row' class='active'>Email-ID<font color="red">*</font>:
								</th>
								<td class="active"><form:input type="text"
										class="form-control input-lg" placeholder="Enter Email-ID"
										path="email" required="true" /></td>
							</tr>

							<tr>
								<th scope='row' class='active'>Date of Birth:</th>
								<td class="active"><form:input type="text"
										class="form-control input-lg"
										placeholder="Enter Date of Birth" path="dob" /></td>
							</tr>

							<tr>
								<th scope='row' class='active'>CIN<font color="red">*</font>:
								</th>
								<td class="active"><form:input type="text"
										class="form-control input-lg" placeholder="Enter CIN"
										path="cin" required="true" /></td>
							</tr>

							<tr>
								<th scope='row' class='active'>Gender:</th>
								<td class="active">
									<%-- <form:input type="text"
										class="form-control input-lg" placeholder="Enter Gender"
										path="gender" /> --%>
									<h4>
										<form:radiobutton style="height:15px; width:15px;"
											path="gender" value="Male" />
										Male
										<form:radiobutton style="height:15px; width:15px;"
											path="gender" value="Female" />
										Female
									</h4>
								</td>
							</tr>

							<tr>
								<th scope='row' class='active'>Phone No:</th>
								<td class="active"><form:input type="text"
										class="form-control input-lg" placeholder="Enter Phone No."
										path="phone" maxlength="10" /></td>
							</tr>

							<tr>
								<th scope='row' class='active'>Citizenship:</th>
								<td class="active"><form:input type="text"
										class="form-control input-lg" placeholder="Enter Citizenship"
										path="citizenship" /></td>
							</tr>

						</table>
					</div>
				</div>
			</div>
			<div class="panel myBackground">
				<div class="panel-heading">
					<h3 align="center">
						<b>Add/Remove Degree</b>
					</h3>
				</div>
				<br /> <br />
				<div class="row">
					<div class="col-md-offset-2 col-md-8">
						<div id="dynamicAdd">
							<table border="2" class="table">
								<tr bgcolor="#CC3333">
									<th><font color="white">University Name</font></th>
									<th><font color="white">Time Period</font></th>
									<th><font color="white">Degree Earned</font></th>
									<th><font color="white">Major</font></th>
									<c:if test="${fn:length(application.degrees) ne 0 }">
										<th><font color="white">Delete</font></th>
									</c:if>
								</tr>
								<tbody align = "center">
		
								<c:forEach items="${application.degrees}" var="deg">
									<tr class="active">

										<td>${deg.schoolName}</td>
										<td>${deg.timePeriod}</td>
										<td>${deg.degreeEarned}</td>
										<td>${deg.major}</td>
										<td><a
											href="deleteDeg.html?appid=${application.id}&degid=${deg.id}&deptid=${application.programs.departments.id}"><span
												class="glyphicon glyphicon-trash"></span></a></td>


									</tr>

								</c:forEach>
								
								<tr class="active">
									<td><input type="text" class="form-control"
										name="schoolname" placeholder="University Name" /></td>
									<td><input type="text" class="form-control"
										name="timeperiod" placeholder="Time Period" /></td>
									<td><input type="text" class="form-control"
										name="degreeearned" placeholder="Degree Earned" /></td>
									<td><input type="text" class="form-control" name="major"
										placeholder="Major" /></td>
									<td></td>
								</tr>
								</tbody>
							</table>
						</div>
						<br />
						<center>
							<input type="button" class="btn btn-danger btn-lg"
								value="Add Degree" onClick="addInput('dynamicAdd');" />
						</center>
					</div>
				</div>
			</div>

			<div class="panel myBackground">
				<div class="panel-heading">
					<h3 align="center">
						<b>Enter Academic Records</b>
					</h3>
				</div>
				<br /> <br />
				<div class="row">
					<div class="col-md-offset-3 col-md-6">
						<table border="2" class="table table-hover">
							<tr>
								<th scope='row' class='active'>GRE:</th>
								<td class="active"><form:input type="text"
										class="form-control input-lg" placeholder="Enter GRE score"
										path="gre" /></td>
							</tr>

							<tr>
								<th scope='row' class='active'>TOEFL:</th>
								<td class="active"><form:input type="text"
										class="form-control input-lg" placeholder="Enter TOEFL score"
										path="toefl" /></td>
							</tr>

							<tr>
								<th scope='row' class='active'>GPA:</th>
								<td class="active"><form:input type="text"
										class="form-control input-lg" placeholder="Enter GPA"
										path="gpa" /></td>
							</tr>

							<tr class='active'>
								<th scope='row'>Transcripts:</th>
								<td><input type="file" class="form-control input-lg"
									style="width: 100%" name="file1" /></td>
							</tr>

						</table>
					</div>
				</div>
			</div>


			<center>
				<input type="submit" class="btn btn-primary btn-lg" name="save"
					value="Save" /> <input type="submit"
					class="btn btn-success btn-lg" name="submit" value="Submit" />
			</center>

		</form:form>
	</div>

</body>
</html>