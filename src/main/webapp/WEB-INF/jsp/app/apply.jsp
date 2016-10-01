<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>New Application</title>
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
	font-size: 30px
}

label {
	font-size: 20px
}

.panel-heading {
	color: #990033;
}
</style>

<script>


	$(document).ready(function() {

		$("#selectDept").change(function() {

			$.ajax({
				method : "POST",
				url : "getPrograms.html",
				data : {
					departmentID : $("#selectDept :selected").val()
				},
				success : function(data) {
					$("#program").html(data);
				}
			});
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
				+ "<tr class='active'>"
				+ "<td><input type='text' class='form-control' name='schoolname' placeholder='University name' required='true'/><br></td>"
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
				<b>Add new Application</b>
			</h1>
			<a href="/gapp/student.html?id=${user.id}"
				class="btn btn-info pull-right btn-lg"><span
				class="glyphicon glyphicon-arrow-left"></span> Back</a>

		</div>

		<form:form modelAttribute="application" name = "req"  onsubmit = "return checkdept()" class="form-inline"
			enctype="multipart/form-data">

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
							<label>Departments<font color="red">*</font>:
							</label>
							<form:select id="selectDept" path="programs.departments.id"
								items="${populateDepartments }" itemValue="id"
								itemLabel="departmentName" class="form-control input-lg" required="true"></form:select>
						</div>
						<br />

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
					<div class="col-md-offset-2 col-md-8">
						<table border="2" class="table table-hover">
							<tr class="active">
								<th scope='row'>First Name<font color="red">*</font>:
								</th>
								<td><form:input type="text" class="form-control input-lg"
										placeholder="Enter First Name" style="width: 100%"
										path="firstName" required="true" /></td>
							</tr>

							<tr class="active">
								<th scope='row'>Last Name<font color="red">*</font>:
								</th>
								<td><form:input type="text" class="form-control input-lg"
										placeholder="Enter Last Name" style="width: 100%"
										path="lastName" required="true" /></td>
							</tr>

							<tr class="active">
								<th scope='row'>Email-ID<font color="red">*</font>:
								</th>
								<td><form:input type="text" class="form-control input-lg"
										placeholder="Enter Email-ID" style="width: 100%" path="email"
										required="true" /></td>
							</tr>

							<tr class="active">
								<th scope='row'>Date of Birth:</th>
								<td><form:input type="text" class="form-control input-lg"
										placeholder="Enter Date of Birth" style="width: 100%"
										path="dob" /></td>
							</tr>

							<tr class="active">
								<th scope='row'>CIN<font color="red">*</font>:
								</th>
								<td><form:input type="text" class="form-control input-lg"
										placeholder="Enter CIN" style="width: 100%" path="cin"
										required="true" /></td>
							</tr>

							<tr class="active">
								<th scope='row'>Gender:</th>
								<td>
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

							<tr class="active">
								<th scope='row'>Phone No:</th>
								<td><form:input type="text" class="form-control input-lg"
										placeholder="Enter Phone No." style="width: 100%" path="phone"
										maxlength="10" /></td>
							</tr>

							<tr class="active">
								<th scope='row'>Citizenship:</th>
								<td><form:input type="text" class="form-control input-lg"
										placeholder="Enter Citizenship" style="width: 100%"
										path="citizenship" /></td>
							</tr>

						</table>
					</div>
				</div>
			</div>

			<div class="panel myBackground">
				<div class="panel-heading">
					<h3 align="center">
						<b>Add Degree</b>
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
								</tr>

								<tr class="active">
									<td><input type="text" class="form-control"
										name="schoolname" placeholder="University Name"
										required="true" /><br></td>
									<td><input type="text" class="form-control"
										name="timeperiod" placeholder="Time Period" required="true" /><br></td>
									<td><input type="text" class="form-control"
										name="degreeearned" placeholder="Degree Earned"
										required="true" /><br /></td>
									<td><input type="text" class="form-control" name="major"
										placeholder="Major" required="true" /><br /></td>
								</tr>
							</table>
						</div>
						<br />
						<center>
							<input type="button" class="btn btn-danger btn-lg" value="Add Degree"
								onClick="addInput('dynamicAdd');" />
						</center>
						<br/>
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
							<tr class='active'>
								<th scope='row'>GRE:</th>
								<td><form:input type="text" class="form-control input-lg"
										placeholder="Enter GRE score" style="width: 100%" path="gre" /></td>
							</tr>

							<tr class='active'>
								<th scope='row'>TOEFL:</th>
								<td><form:input type="text" class="form-control input-lg"
										placeholder="Enter TOEFL score" style="width: 100%"
										path="toefl" /></td>
							</tr>

							<tr class='active'>
								<th scope='row'>GPA:</th>
								<td><form:input type="text" class="form-control input-lg"
										placeholder="Enter GPA" style="width: 100%" path="gpa" /></td>
							</tr>

							<tr class='active'>
								<th scope='row'>Transcripts<font color="red">*</font>:
								</th>
								<td><input type="file" class="form-control input-lg"
									style="width: 100%" name="file1" required="true"/></td>
							</tr>

						</table>
					</div>
				</div>
				<center>
					<input type="submit" class="btn btn-primary btn-lg" name="save"
						value="Save" /> <input type="submit"
						class="btn btn-success btn-lg" name="submit" value="Submit" />
				</center>
					<br />

			</div>

		</form:form>
	</div>

</body>
</html>