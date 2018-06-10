<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">

<title>Add Actor</title>
</head>
<body>
<h1>Enter the information of the actor you would like to add.</h1>
<form action="addactor.do" method="GET">
First Name: <input type="text" name="firstName" value="${actor.firstName}"><br>
Last Name: <input type="text" name="lastName" value="${actor.lastName}"><br>
	<input type="submit" value="Add Actor" />
	<input type="hidden" name="actorId" value="${actor.id}" />
	</form>
	<div>
		<a href="index.html">Home</a>
	</div>

</body>
</html>