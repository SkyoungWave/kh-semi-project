<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="com.kh.bookBoard.model.vo.Book" %>
<%
	String contextPath = request.getContextPath();
	Book book = (Book)request.getAttribute("book");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
		background:rgb(255, 255, 255);
		color:rgb(0, 0, 0);
		width:1000px;
		margin:auto;  /*가운데 정렬*/
		margin-top:50px; /*위로부터 50px만큼 여백*/
	}
 </style>
</head>
<body>
	<div class="outer">
		<br>
		<h2 align="center">게시글 상세 보기</h2>
		
		<!-- <input type="hidden" name="bookNo" value="<%=book.getBookNo()%>"> -->
		
		<table id="detail-area" align="center" border="1px" >
			<td colspan="3" align="center" style="border: 1;" rowspan="5">
				<img src='<%=contextPath %>/<%=book.getFilePath() %><%=book.getChangeName() %>' width="200" height="300">
			</td>
			<tr>
				<td>제목:</td>
				<td colspan="2"><%=book.getBookTitle() %></td>
			</tr>
			<tr>
				<td>장르:</td>
				<td colspan="2"><%=book.getGenre() %></td>
			</tr>
			<tr>
				<td>저자</td>
				<td colspan="2"><%=book.getAuthor() %></td>
			</tr>
			<tr>
				<td>출판년도:</td>
				<td colspan="2"><%=book.getCreateBook() %></td>
			</tr>



			<tr>
				<th>책 내용</th>
                <td colspan="5"><p>
					<%=book.getBookInfo() %>
				</p>
				</td>
			</tr>
		</table>
		
		<br>
		<div align="center">
			<button onclick = "location.href='<%=contextPath%>/list.bo?searchText='">목록가기</button>
			<button onclick = "location.href='<%=contextPath%>/updateView.bo?bno=<%=book.getBookNo()%>'">관리자만 보이게/수정하기</button>
			<button onclick = "reqDel();" >관리자만 보이게/삭제하기</button>
		
		</div>
		
		
		<br>
		
		<script>
			
			function reqDel(){
				if (!confirm("정말로 삭제하시겠습니까?")) {
		            alert("취소(아니오)를 누르셨습니다.");
		        } else {
		        	location.href='<%=contextPath%>/delete.bo?bno=<%=book.getBookNo()%>';
		        }
			}	
		
		</script>
	
		
		<br><br>
		
	</div>
</body>
</html>