<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert title here</title>
</head>
<body>
<h2>User Management</h2>
<table border = "1">
<tr>
<th>ID</th><th>Username</th><th>Password</th><th>Operations</th></tr>
<c:forEach items = "${users}" var = "user">
<tr>
	<td> ${user.id}</td>
	<td>${user.email}</td>
	<td>${user.password}</td>
	<td><a href = "view.html?id=${user.id }">View</a>
	<a href = "view/${user.id }.html">View2</a></td>
</tr>
</c:forEach>
</table>
</body>
</html>