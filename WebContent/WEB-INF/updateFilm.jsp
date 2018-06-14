<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

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
<h2>Film ID: ${film.id }</h2>

<form action="updateFilmDetails.do" method="POST" autocomplete="on">
Title <input type="text" name="title" value="${film.title}"><br>
Description <input type="text" name="description" value="${film.description}"><br>
<h3>Select Special Features:</h3>
 <c:choose>
 <c:when test="${not empty trailers}"> Trailers<input type="checkbox" name="specialFeatures" value="Trailers" checked>
 </c:when>  
 <c:otherwise> Trailers<input type="checkbox" name="specialFeatures" value="Trailers">
 </c:otherwise>
 </c:choose>
 <c:choose>
 <c:when test="${not empty Commentaries}"> Commentaries<input type="checkbox" name="specialFeatures" value="Commentaries" checked>
 </c:when>  
 <c:otherwise> Commentaries<input type="checkbox" name="specialFeatures" value="Commentaries">
 </c:otherwise>
 </c:choose>
 <c:choose>
 <c:when test="${not empty DS}"> Deleted Scenes<input type="checkbox" name="specialFeatures" value="Deleted Scenes" checked>
 </c:when>  
 <c:otherwise> Deleted Scenes<input type="checkbox" name="specialFeatures" value="Deleted Scenes">
 </c:otherwise>
 </c:choose>
 <c:choose>
 <c:when test="${not empty BS}"> Behind the Scenes<input type="checkbox" name="specialFeatures" value="Behind the Scenes" checked>
 </c:when>  
 <c:otherwise> Behind the Scenes<input type="checkbox" name="specialFeatures" value="Behind the Scenes">
 </c:otherwise>
 </c:choose> 
<br>
<h3>Select Rating:</h3>
<c:choose>
 <c:when test="${not empty G}"> G<input type="radio" name="rating" value="G" checked>
 </c:when>  
 <c:otherwise> G<input type="radio" name="rating" value="G" >
 </c:otherwise>
 </c:choose> 
<c:choose>
 <c:when test="${not empty PG}"> PG<input type="radio" name="rating" value="PG" checked>
 </c:when>  
 <c:otherwise> PG<input type="radio" name="rating" value="PG" >
 </c:otherwise>
 </c:choose> 
<c:choose>
 <c:when test="${not empty PG13}"> PG13<input type="radio" name="rating" value="PG13" checked>
 </c:when>  
 <c:otherwise> PG13<input type="radio" name="rating" value="PG13" >
 </c:otherwise>
 </c:choose> 
<c:choose>
 <c:when test="${not empty R}"> R<input type="radio" name="rating" value="R" checked>
 </c:when>  
 <c:otherwise> R<input type="radio" name="rating" value="R" >
 </c:otherwise>
 </c:choose> 
<c:choose>
 <c:when test="${not empty NC17}"> NC17<input type="radio" name="rating" value="NC17" checked>
 </c:when>  
 <c:otherwise> NC17<input type="radio" name="rating" value="NC17" >
 </c:otherwise>
 </c:choose> 
<br>
Release Year <input type="text" name="releaseYear" value="${film.releaseYear}"><br>
Duration <input type="text" name="rentalDuration" value="${film.rentalDuration}"><br>
Rental Rates <input type="text" name="rentalRates" value="${film.rentalRates}"><br>
Length <input type="text" name="length" value="${film.length}"><br>
Replacement Cost <input type="text" name="replacementCost" value="${film.replacementCost}"><br>
Category <input type="text" name="category" value="${film.categories}"><br>
	<input type="hidden" name="filmID" value="${film.id}"/>
	<input type="hidden" name="film" value="${film}"/>
	<input type="submit" value="Update Film"/>
	</form>
	

 <br><br>

	<div><a href="index.html">Home</a></div>
	
</body>
</html>