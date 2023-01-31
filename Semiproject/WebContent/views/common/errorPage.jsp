<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String errorMsg = (String)request.getAttribute("errorMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   
	<div align="center">
	 	<img src="resources/image/error.webp" alt="에러" />
		<h1 align="center" style="color:red"><%=errorMsg %></h1>
		<a href="/Semiproject" style="text-decoration:none">메인페이지로</a>
	</div>
	
</body>
</html>