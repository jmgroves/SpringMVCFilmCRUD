<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Film</title>
</head>
<body>
<h1>Add Film</h1>
<form action="addingFilm.do" method="POST">
Title <input type="text" name="title" value="${film.title}"><br>
Description <input type="text" name="description" value="${film.description}"><br>
Special Features <input type="text" name="specialFeatures" value="${film.specialFeatures}"><br>
Rating <input type="text" name="rating" value="${film.rating}"><br>
Release Year <input type="text" name="releaseYear" value="${film.releaseYear}"><br>
Duration <input type="text" name="rentalDuration" value="${film.rentalDuration}"><br>
Rental Rates <input type="text" name="rentalRates" value="${film.rentalRates}"><br>
Length <input type="text" name="length" value="${film.length}"><br>
Replacement Cost <input type="text" name="replacementCost" value="${film.replacementCost}"><br>
Category <input type="text" name="category" value="${film.categories}"><br>
	<input type="hidden" name="film" value="${film}"/>
	<input type="submit" value="Add Film"/>
	</form>
	

 <br><br>

	<div><a href="index.html">Home</a></div>
</body>
</html>