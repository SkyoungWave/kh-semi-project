<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.bookBoard.model.vo.Genre"%>

<%
	String contextPath = request.getContextPath();
	ArrayList<Genre> glist = (ArrayList<Genre>)request.getAttribute("glist");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
    .outer{
		margin:auto;  /*가운데 정렬*/
		margin-top:50px; /*위로부터 50px만큼 여백*/
	}
	</style>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<body>
	
	<div class="outer" align="center">
	<h2>도서 등록</h2>
	<br><br>
		<form action="enroll.bo" method="post" enctype="multipart/form-data" >
		 <!-- enctype="multipart/form-data" -->
		    <table>
		        <tr>
		            <th>제목</th>
		            <td><input type="text" name="title" required></td>
		        </tr>
		        <tr>
		            <th>장르</th>
					<td>
					<select name="genre">
						<%for(Genre g : glist){ %>
							<option value="<%=g.getGenreNo() %>"><%=g.getGenreName() %></option>
						<%} %>
					</select>
				</td>
		        </tr>
		        <tr>
		            <th>저자</th>
		            <td><input type="text" name="author" required></td>
		        </tr>
		        <tr>
		            <th>출판년도</th>
		            <td><input type="date" name="pubdate" required></td>
		        </tr>
		        
		        <tr>
		            <th>책 내용</th>
		            <td><textarea name="bookContent" cols="50" rows="10" style="resize:none"></textarea></td>
		        </tr>
		        
		       	<tr>
		            <th>책 표지</th>
		            <td>
		                <input type="file" id="cover" name="upfile" onchange="loadImg(this,1);" required>
		            </td>
		        </tr>
		        
		        <tr>
		        <th></th>
		        <td><img id="bookImg" width="200" height="300"></td>
		        
		        </tr>
		    </table>
		    <script>
		        
		        
		    function loadImg(inputFile, num){
		        console.log(inputFile.files.length);
		
		        if(inputFile.files.length ==1){
		            var reader =  new FileReader();
		            reader.readAsDataURL(inputFile.files[0]);
		            reader.onload = function(e){
						$("#bookImg").attr("src",e.target.result);
		            }
		        }
		        
		    }
		    </script>
		    <input type="submit">
	    </form>
	    
    </div>
    
</body>
</html>