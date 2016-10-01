<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Edit Department</title>
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
	font-size: 20px;
}
</style>
</head>

<body background="/gapp/images/img6.jpg">
	<div class="container">
		<div class="jumbotron myBackground">
			<h1 align="center">
				<b>GAPP Department</b>
			</h1>
			<a href="/gapp/admin.html" class="btn btn-info pull-right btn-lg"><span
				class="glyphicon glyphicon-arrow-left"></span> Back</a>
		</div>

		<div class="panel myBackground">
			<div class="panel-heading">
				<h3 align="center">
					<b>Edit Department <c:out value="${user.getFirstName() }"></c:out></b>
				</h3>
			</div>
			<br /> <br />
			<div class="row">
				<div class="col-md-offset-2 col-md-8">
					<form:form modelAttribute="department" action="editDept.html">
						<table border="2" class="table table-hover">
							<tbody>
								<tr class="active">
									<th scope="row">Department Name:</th>
									<td class="active"><form:input type="text"
											class="form-control" path="departmentName" /></td>
								</tr>

								<tr class="active">
									<th>Program Name:</th>
									<td><c:forEach items="${prog}" var="prg"
											varStatus="theCount">
								${theCount.count}. ${prg.programName}
								<a style="float: right"
												href="deleteProg.html?progId=${prg.id}&deptId=${department.id}">Remove</a>
											<br />
										</c:forEach></td>
								</tr>
								<tr class="active">

									<th>Additional Info:</th>
									<td><c:forEach items="${addinfo}" var="info"
											varStatus="theCount">
											${theCount.count}. ${info.fieldName} <a style="float: right"
												href="deleteAddInfo.html?addinfoId=${info.id}&deptId=${department.id}">Remove</a>
											<br />
										</c:forEach></td>
								</tr>

								<tr class="active">
									<td colspan="2" scope="row" style="text-align: center;"
										class="active">
										<button class="btn btn-danger btn-lg" type="submit"
											name="save">
											<span class="glyphicon glyphicon-floppy-save"></span> Confirm
											Save
										</button>
									</td>
								</tr>

							</tbody>
						</table>

					</form:form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>