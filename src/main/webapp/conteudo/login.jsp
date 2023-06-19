<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//Cookie userId = new Cookie("userId", "123456");
		//userId.setMaxAge(60*60*24*7);
		//response.addCookie(userId);
		
		session.setAttribute("userId","123456");
	%>
</body>
</html>