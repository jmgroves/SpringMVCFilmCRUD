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


<form action="updateFilmDetails.do" method="POST">
Title <input type="text" name="title" value="${oldFilm.title}"><br>
Description <input type="text" name="description" value="${oldFilm.description}"><br>
Special Features <input type="text" name="specialFeatures" value="${oldFilm.specialFeatures}"><br>
Release Year <input type="text" name="releaseYear" value="${oldFilm.releaseYear}"><br>
Duration <input type="text" name="rentalDuration" value="${oldFilm.rentalDuration}"><br>
Rental Rates <input type="text" name="rentalRates" value="${oldFilm.rentalRates}"><br>
Length <input type="text" name="length" value="${oldFilm.length}"><br>
Replacement Cost <input type="text" name="replacementCost" value="${oldFilm.replacementCost}"><br>
Category <input type="text" name="category" value="${oldFilm.categories}"><br>
	<input type="submit" value="Update Film" /></form>

 <br><br>

	<div><a href="index.html">Home</a></div>
	
</body>
</html>