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
	<form:label path="specialFeatures">Special Features: </form:label>
	<form:input path="specialFeatures"/>
	<form:errors path="specialFeatures" />
	<br>
	<form:label path="releaseYear">Release Year: </form:label>
	<form:input path="releaseYear"/>
	<form:errors path="releaseYear" />
	<br>
	<form:label path="rentalDuration">Rental Duration: </form:label>
	<form:input path="rentalDuration"/>
	<form:errors path="rentalDuration" />
	<br>
	<br>
	<form:label path="rentalRates">Rental Rates: </form:label>
	<form:input path="rentalRates"/>
	<form:errors path="rentalRates" />
	<br>
	<form:label path="length">Length: </form:label>
	<form:input path="length"/>
	<form:errors path="length" />
	<br>
	<form:label path="replacementCost">Replacement Cost: </form:label>
	<form:input path="replacementCost"/>
	<form:errors path="replacementCost" />
	<br>
	<form:label path="category">Category: </form:label>
	<form:input path="category"/>
	<form:errors path="category" />
	<br>
	<input type="submit" value="Update Film" />
	</form:form>	
	<form action="delete.do" method="GET">
     <input type="submit" value="Delete" name = "delete"/><br />
     <input type="hidden" name="filmId" value="${film.id}" />
	</form>

	<div><a href="index.html">Home</a></div>
	
</body>
</html>