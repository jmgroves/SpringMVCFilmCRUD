<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>View</title>
</head>
<body>
<c:forEach var="filmList" items="${filmList}">
<c:out value="${filmList.film }">
<h1>${film.title}</h1>
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
	</ul></c:out>
</c:forEach>

</body>
</html>