<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Actor View</title>
</head>
<body>
	<c:choose>
		<c:when test="${not empty noActor }">Actor ID not found.</c:when>
		<c:otherwise>
			<c:if test="${not empty addedActor }">
				<h1>Actor Added Successfully</h1>
			</c:if>
			<h2>Actor ${actor.firstName } ${actor.lastName }</h2>
			<h3>Actor ID: ${actor.id }</h3>
			<br />
			<form action="deleteActor.do" method="GET">
				<input type="submit" value="Delete" name="" /><br /> <input
					type="hidden" name="filmId" value="${actor.id}" />
			</form>
			<form action="updateActorView.do" method="GET">
				<input type="submit" value="Update" name="" /><br /> <input
					type="hidden" name="filmId" value="${film.id}" />
			</form>
		</c:otherwise>
	</c:choose>
	<div>
		<a href="index.html">Home</a>
	</div>
</body>
</html>