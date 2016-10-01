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
<title>GAPP Registration</title>
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

h4 {
	font-size: 20px
}

.navbar {
	padding-top: 7px;
	padding-bottom: 7px;
	border: 0;
	border-radius: 0;
	margin-bottom: 0;
	font-size: 12px;
	letter-spacing: 5px;
}

.navbar-nav  li a:hover {
	color: #FF6600 !important;
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

</style>
</head>
<body background="images/img6.jpg">
	<div class="container">
		<nav class="navbar navbar-inverse nav-fixed-top">
		<h3>
			<span class="navbar-header"> <a class="navbar-brand" href="#"><span
					class="glyphicon glyphicon-education"></span><b>GAPP</b></a>
			</span>
		</h3>
		<h4>
			<ul class="nav navbar-nav">
				<li><a href="index.html"><span
						class="glyphicon glyphicon-home"></span><b>Home</b></a></li>
				<li><a href="login.html"><span
						class="glyphicon glyphicon-log-in"></span><b>Login</b></a></li>
			</ul>
		</h4>
		</nav>
		<div class="jumbotron myBackground">
			<h1 align="center">
				<b>GAPP Registration</b>
			</h1>
		</div>

		<div class="panel myBackground">
			<div class="panel-heading">
				<h3 align="center">
					<b>Register new User <span class="glyphicon glyphicon-user"></span></b>
				</h3>
			</div>
			<br /> <br />
			<div class="row">
				<div class="col-md-offset-3 col-md-6">
					<form:form modelAttribute="user">
						<table class="table">
							<tbody>
								<tr>
									<th scope="row">First Name:</th>
									<td><form:input type="text" class="form-control input-lg"
											placeholder="Enter First Name" path="firstName" /><font
										color="red"><i><b><form:errors path="firstName" /></b></i></font></td>
								</tr>
								<tr>
									<th scope="row">Last Name:</th>
									<td><form:input type="text" class="form-control input-lg"
											placeholder="Enter Last Name" path="lastName" /><font
										color="red"><i><b><form:errors path="lastName" /></b></i></font></td>
								</tr>
								<tr>
									<th scope="row">Email-ID:</th>
									<td><form:input type="text" class="form-control input-lg"
											placeholder="Enter Email-ID" path="email" /><font
										color="red"><i><b><form:errors path="email" /></b></i></font></td>
								</tr>
								<tr>
									<th scope="row">Password:</th>
									<td><form:input type="password" class="form-control input-lg"
											placeholder="Enter Password" path="password" /><font
										color="red"><i><b><form:errors path="password" /></b></i></font></td>
								</tr>
								<tr>
									<td colspan="2" scope="row" style="text-align: center;">
										<button type="submit" name="register"
											class="myButton">
											<span class="glyphicon glyphicon-check"></span> Register
										</button>
									</td>
								</tr>
							</tbody>
						</table>
						<center><h4><b><a href = "login.html">Existing User Login here.</a></b></h4></center>
						<br/>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>