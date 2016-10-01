<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Add Department</title>
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
.panel-heading {
	color: #990033;
}
</style>
</head>
<body background="/gapp/images/img6.jpg">
<div class="container">
			<div class="jumbotron myBackground">
				<h1 align="center"><b>Department</b></h1>
				<a href="/gapp/admin.html" class="btn btn-info pull-right btn-lg"><span
					class="glyphicon glyphicon-arrow-left"></span> Back</a>
			</div>
			
			<div class="panel myBackground">
			<div class="panel-heading"> <h3 align = "center"><b>Add new Department</b></h3></div><br/><br/>
			<div class="row">
				<div class="col-md-offset-2 col-md-8">
					<form:form modelAttribute="department">
						<table border="2" class="table table-hover">
							<tbody>
								<tr>
									<th scope="row" class="active">Department Name:</th>
									<td class="active"><form:input type="text" class="form-control" placeholder="Enter Department Name"
											path="departmentName" /></td>
								</tr>
			
								<tr>
									<td colspan="2" scope="row" style="text-align: center;" class="active">										
										<button type="submit" class="btn btn-primary btn-lg" name="add">
											<span class="glyphicon glyphicon-check"></span>
											Confirm Add
										</button></td>
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