<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Actor View</title>
</head>
<body>
	<h1>Actor ${actor.firstName } ${actor.lastName }</h1>
	<h2>Actor ID: ${actor.id }</h2>
	<br />
	<form action="deleteActor.do" method="GET">
		<input type="submit" value="Delete" name="" /><br /> <input
			type="hidden" name="filmId" value="${actor.id}" />
	</form>
	<form action="updateActor.do" method="GET">
		<input type="submit" value="Update" name="" /><br /> <input
			type="hidden" name="filmId" value="${film.id}" />
	</form>
	<div>
		<a href="index.html">Home</a>
	</div>
</body>
</html>