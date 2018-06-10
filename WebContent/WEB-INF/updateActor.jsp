<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="updateActor.do" method="POST">
Film Id <input type="text" name="filmId" value="${actor.id}"><br>
Title <input type="text" name="title" value="${actor.firstName}"><br>
Description <input type="text" name="description" value="${actor.lastName}"><br>
	<input type="submit" value="Update Film" /></form>

 <br><br>
</body>
</html>