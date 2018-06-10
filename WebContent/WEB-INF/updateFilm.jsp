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
Title <input type="text" name="title" value="{$oldFilm.title">
Description <input type="text" name="description" value="{$oldFilm.description">
Special Features <input type="text" name="specialFeatures" value="{$oldFilm.specialFeatures">
Release Year <input type="number" name="releaseYear" value="{$oldFilm.releaseYear">
Duration <input type="number" name="rentalDuration" value="{$oldFilm.rentalDuration">
Rental Rates <input type="number" name="rentalRates" value="{$oldFilm.rentalRates">
Length <input type="number" name="length" value="{$oldFilm.length">
Replacement Cost <input type="number" name="replacementCost" value="{$oldFilm.replacementCost">
Category <input type="text" name="category" value="{$oldFilm.category">
	<input type="submit" value="Update Film" /></form>

 

	<div><a href="index.html">Home</a></div>
	
</body>
</html>