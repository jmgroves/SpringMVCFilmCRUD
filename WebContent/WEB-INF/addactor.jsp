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


<h2>${actor.firstName } ${actor.lastName } was added successfully.</h2>
	<h3>Actor Id: ${actor.id }</h3>
	<div>
		<a href="index.html">Home</a>
	</div>

</body>
</html>