<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="skeleton.css">
<meta charset="UTF-8">

<title>View</title>
</head>
<body>
	<c:choose>
		<c:when test="${empty filmList }">
			<h3>No films found meeting your search</h3>
		</c:when>
		<c:otherwise>
			<c:forEach var="film" items="${filmList}">
				<h1>${film.title}</h1>
				<h2>${film.id }</h2>
				
				<ul>
					<li>Description: ${film.description }</li>
					<li>Special Features: ${film.specialFeatures }</li>
					<li>Released in: ${film.releaseYear }</li>
					<li>Language: ${film.languageId }</li>
					<li>Rental Duration: ${film.rentalDuration }</li>
					<li>Rental Rate: ${film.rentalRates }</li>
					<li>Length: ${film.length }</li>
					<li>Replacement Cost: ${film.replacementCost }</li>
					<li>Actors: ${film.actorList }</li>
					<li>Category: ${film.categories }</li>
				</ul>
				<form action="updateFilm.do" method="GET">
					<input type="submit" value="Update" name="" /><br /> <input
						type="hidden" name="filmId" value="${film.id}" />
				</form>
				<form action="delete.do" method="GET">
					<input type="submit" value="Delete" name="" /><br /> <input
						type="hidden" name="filmId" value="${film.id}" />
				</form>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	<div>
		<a href="index.html">Home</a>
	</div>

</body>
</html>