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
<c:out value="${filmList.val }"></c:out>
</c:forEach>

</body>
</html>