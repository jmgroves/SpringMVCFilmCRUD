<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>View</title>
</head>
<body>
	<form:form action="edit.do" method="POST" modelAttribute = "film">
	<form:label path="title">Title: </form:label>
	<form:input path="title"/>
	<form:errors path="title" />
	<br>
	<form:label path="description">Description: </form:label>
	<form:input path="description"/>
	<form:errors path="description" />
	<br>
	<form:label path="firstName">Special Features: </form:label>
	<form:input path="firstName"/>
	<form:errors path="firstName" />
	<br>
	<form:label path="lastName">Last Name: </form:label>
	<form:input path="lastName"/>
	<form:errors path="lastName" />
	<br>
	<form:label path="age">Age: </form:label>
	<form:input path="age"/>
	<form:errors path="age" />
	<br>
	<input type="submit" value="Register" />
	</form:form>	
	<form action="delete.do" method="GET">
     <input type="submit" value="Delete" name = "delete"/><br />
     <input type="hidden" name="filmId" value="${film.id}" />
	</form>
	<c:choose>
	<c:when test="${not empty deletedFilm}">You deleted ${deletedFilm}</c:when>
	<c:when test="${not empty updatedFilm}">You updated ${updatedFilm.title}</c:when>
	<c:otherwise>
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
		
	</ul></c:otherwise>
	</c:choose>
	<div><a href="index.html">Home</a></div>
	
</body>
</html>