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
<h2>Film ID: ${oldFilm.id }</h2>

<form action="updateFilmDetails.do" method="POST">
Title <input type="text" name="title" value="${oldFilm.title}"><br>
Description <input type="text" name="description" value="${oldFilm.description}"><br>
Special Features <input type="text" name="specialFeatures" value="${oldFilm.specialFeatures}"><br>
Rating <input type="text" name="rating" value="${oldFilm.rating}"><br>
Release Year <input type="text" name="releaseYear" value="${oldFilm.releaseYear}"><br>
Duration <input type="text" name="rentalDuration" value="${oldFilm.rentalDuration}"><br>
Rental Rates <input type="text" name="rentalRates" value="${oldFilm.rentalRates}"><br>
Length <input type="text" name="length" value="${oldFilm.length}"><br>
Replacement Cost <input type="text" name="replacementCost" value="${oldFilm.replacementCost}"><br>
Category <input type="text" name="category" value="${oldFilm.categories}"><br>
	<input type="hidden" name="filmID" value="${oldFilm.id}"/>
	<input type="hidden" name="film" value="${oldFilm}"/>
	<input type="submit" value="Update Film"/>
	</form>
	

 <br><br>

	<div><a href="index.html">Home</a></div>
	
</body>
</html>