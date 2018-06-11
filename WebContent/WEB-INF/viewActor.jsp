<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
  <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="skeleton.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Actor View</title>
</head>
<body>
	<c:choose>
		<c:when test="${not empty noActor }">Actor ID not found.</c:when>
		<c:when test="${not empty deletedActor}">You deleted ${deletedActor}</c:when>
		<c:when test="${empty actor }">Your actor failed to Add/Update</c:when>
		<c:otherwise>
			<c:if test="${not empty addedActor }">
				<h1>Actor Added Successfully</h1>
			</c:if>
			<h2>Actor ${actor.firstName } ${actor.lastName }</h2>
			<h3>Actor ID: ${actor.id }</h3>
			<br />
			<form action="deleteActor.do" method="GET">
				<input type="submit" value="Delete" name="" /><br /> <input
					type="hidden" name="actorId" value="${actor.id}" />
			</form>
			<form action="updateActorView.do" method="GET">
				<input type="submit" value="Update" name="" /><br /> <input
					type="hidden" name="actorId" value="${actor.id}" />
			</form>
		</c:otherwise>
	</c:choose>
	<div>
		<a href="index.html">Home</a>
	</div>
</body>
</html>