<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,com.kh.bookApply.model.vo.*"%>
<%
	BookApply ba=(BookApply)request.getAttribute("ba");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	#detail-area{
		background-color: black;
		width:auto;
	}
	#detail{
		color: white;
		width: 400px;
		padding-top:50px;
	}

</style>
<body>
	<%@include file="/views/common/menubar.jsp" %>
	<br>
	<div id="detail-area" align="center">
		<table id="detail"border="1"> 
			<tr>
				<th>작성자</th>
				<td><%=ba.getBookApplyWriter() %></td>
				<th>작성일</th>
				<td><%=ba.getCreateDate() %></td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="3"><%=ba.getBookApplyTitle() %></td>
			</tr>
			<tr>
				<th style="width: 50px; height: 200px;">내용</th>
				<td colspan="3"><%=ba.getBookApplyContent() %></td>
			</tr>
		
		</table>
		<br>
		<button onclick="location.href='<%=contextPath%>/list.ba?currentPage=1'">목록으로 </button>
	</div>

</body>

</html>