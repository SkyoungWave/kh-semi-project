<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.bookBoard.model.vo.Genre, com.kh.bookBoard.model.vo.Book, com.kh.bookBoard.model.vo.Cover"%>

<%
	String contextPath = request.getContextPath();
	Book b = (Book)request.getAttribute("b");
	Cover c = (Cover)request.getAttribute("c");
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
	<h2>도서 정보 수정</h2>
	<br><br>
		<form action="update.bo" method="post" id="update-form" enctype="multipart/form-data" >
		 <!-- enctype="multipart/form-data" -->
		    <table>
		        <tr>
		        	<input type="hidden" name = "bno" value="<%=b.getBookNo() %>">
		            <th>제목</th>
		            <td><input type="text" name="title" required value="<%=b.getBookTitle() %>"></td>
		        </tr>
		        <tr>
		            <th>장르</th>
					<td>
					<select name="genre">
						<%for(Genre g : glist){ %>
							<option value="<%=g.getGenreNo() %>"><%=g.getGenreName() %></option>
						<%} %>
						
					</select>
					<script>
						$(function(){
							$("#update-form option").each(function(){
								if($(this).text()=="<%=b.getGenre() %>"){
									$(this).attr("selected", true);
								}
							})
						})
					</script>
				</td>
		        </tr>
		        <tr>
		            <th>저자</th>
		            <td><input type="text" name="author" required value="<%=b.getAuthor()%>"></td>
		        </tr>
		        <tr>
		            <th>출판년도</th>
		            <td><input type="date" name="pubdate" required value="<%=b.getCreateBook() %>"></td>
		        </tr>
		        
		        <tr>
		            <th>책 내용</th>
		            <td><textarea name="bookContent" cols="50" rows="10" style="resize:none"><%=b.getBookInfo() %></textarea></td>
		        </tr>
		        
		       	<tr>
		            <th>책 표지</th>
		            <td>
		            	<%=c.getOriginName() %>
						<input type="hidden" name = "originFileNo" value="<%=c.getFileNo() %>">
						<input type="hidden" name = "originFileName" value="<%=c.getChangeName() %>">
		            
		                <input type="file" name="reUpfile" required onchange="loadImg(this,1);" >
					</td>
		        </tr>
		        
		        <tr>
		        <th></th>
		        
		        <td>
		        
		        <img src='<%=contextPath %>/<%=c.getFile_path() %><%=c.getChangeName() %>' id="bookImg" width="200" height="300"></td>
		        
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