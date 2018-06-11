<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Film</title>
</head>
<body>
<form action="addingFilm.do" method="POST">
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