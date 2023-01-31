<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.bookBoard.model.vo.Book" %>
    
<%
	String contextPath = request.getContextPath();
	ArrayList<Book> book = (ArrayList<Book>)request.getAttribute("book");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
	.outer {
	    text-align: center;
	    border: 1px solid gray;
	    width: 100%;
	    margin: auto;
	    border-radius: 20px;
	}
    .list-area{
        border: 1px solid white;
        text-align: center;
    }
    .list-area>tbody>tr:hover{
        background-color: gray;
        cursor: pointer;
    }
    #searchBook:hover{
		background-color: pink;
		border: 1px solid;
		
	}
</style>
</head>

<body>
	<br><br>
    <h1 align="center"> 성공할 징조</h1>
	<br><br>
    <div class="outer">
    	
    <form action="list.bo">
		<input name="searchText" type="text" width="200px">
		<input type="submit" value="검색" id="searchBook" size="1">
	</form>
	<button onclick = "location.href='<%=contextPath%>/enrollForm.bo'">관리자만 보이게하기 등록</button>
	
    <table class="list-area" align="center">
    
        <thead>
            <tr>
            	<th style="display: none"></th>
                <th width="100"style='background-color:white;'>글번호</th>
                <th width="100">표지</th>
                <th width="300">책제목</th>
                <th width="100">저자</th>
            </tr>
        </thead>
        <tbody>
            <%if(book.isEmpty()) {%>
            	<tr>
            		<td>존재하는 책이 없습니다.</td>
            	</tr>
            <%} else{%>
            	<%for(Book b : book) {%>
					<tr>
						<td style="display: none"><%=b.getBookNo() %></td>
						<td><%=b.getRnum() %></td>											
						<td><a href='<%=contextPath %>/<%=b.getFilePath() %><%=b.getChangeName() %>'> <img src='<%=contextPath %>/<%=b.getFilePath() %><%=b.getChangeName() %>'width="100px" height="150px"></a></td>
			            <td><%=b.getBookTitle() %></td>
			            <td><%=b.getAuthor() %></td>
			            <td><input type="button" value="대여"></td>
			            <td><input type="button" value="관심"></td>
					</tr>
                <%} %>
            <%} %>
                

        </tbody>
	
    </table>
    
    <script>
		$(function(){
			$(".list-area>tbody>tr").click(function(){
				location.href="<%=contextPath%>/detail.bo?bno=" + $(this).children().eq(0).text();
			})
		});
	</script>
	
	
    <br><br><br>

    </div>
	
	
	
	


</body>
</html>