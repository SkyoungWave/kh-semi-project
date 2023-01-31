<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,com.kh.bookApply.model.vo.*"%>
<%
	ArrayList<BookApply> list=(ArrayList<BookApply>)request.getAttribute("list");
	Pi pi=(Pi)request.getAttribute("pi");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#list-area{
		background-color:black;
		width:800px;
		height:500px;
		margin:auto;
	}
	#list *{
		color:white;
		margin:auto;
		
	}
	#list{
		margin-top:20px;
		text-align:center;
	}
	#list>tbody tr:hover{
		background-color:gray;
		cursor:pointer;
	}
	

</style>
</head>
<body>
	<%@include file="/views/common/menubar.jsp" %>
	 <div class="nav-area" align="left">
    
     <table>
                <tr>
                    <td>
						<div class="menu"><a href="<%=contextPath %>/list.no?currentPage=1">공지사항</a></div>  
					</td>  
                </tr>
                <tr>
                    <td>
						<div class="menu"><a href="<%=contextPath %>/qnaMain.bo">Q&A</a></div>

					</td>  
                </tr>
                <tr>
                    <td>
        				<div class="menu"><a href="<%=contextPath%>/list.ba?currentPage=1">도서신청</a></div>
					</td>  
                </tr>
     </table>
    </div>
	<div id="list-area" align="center">
		<br>
		<div>
			<button onclick="location.href='<%=contextPath%>/enroll.ba'">글작성</button>
		</div>
		<table id="list" border="1" align="center">
			<thead>
				<tr>
					<th>게시글 번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
			<%if(list.isEmpty()) {%>
            	<tr>
            		<td colspan="6">조회된 게시글이 없습니다.</td>
            	</tr>
            	
            	<%}else{%>
				   		<%for(BookApply b : list) {%>
			                <tr>
			                    <td><%=b.getBookApplyNo()%></td>
			                    <td><%=b.getBookApplyTitle() %></td>
			                    <%if(b.getBookApplyWriter()=="null"){ %>
			                    	<td>아무개</td>
			                    <%}else{ %>
			                    	<td><%=b.getBookApplyWriter() %></td>
			                    <%} %>
			                    <td><%=b.getCount() %></td>
			                    <td><%=b.getCreateDate() %></td>
			                </tr>
			             <%} %>
	            <%} %>
	
			</tbody>
		</table>
		<br><br>
		<div align="center" class="paging-area">
        	<%if(pi.getCurrentPage() != 1) {%>
        	<button class="btn btn-info"  onclick="location.href='<%=contextPath%>/list.ba?currentPage=<%=pi.getCurrentPage()-1%>'">&lt;</button>
        	<%}%>
        	
        	
        	 <%for(int i=pi.getStartPage(); i<=pi.getEndPage(); i++) {%>
        	 	<%if(i==pi.getCurrentPage()) {%>
        	 	<!-- 내가 요청한 페이지 버튼 비활성화 -->
        	 	<button class="btn btn-info" disabled><%=i %></button>
        	 	<%}else{ %>
        			 <button class="btn btn-info" onclick="location.href='<%=contextPath%>/list.ba?currentPage=<%=i%>'"><%=i%></button>
				<%} %>        	 
        	 <%} %>
        	 
        	 <%if(pi.getCurrentPage() != pi.getMaxPage()) {%>
        	<button class="btn btn-info"  onclick="location.href='<%=contextPath%>/list.ba?currentPage=<%=pi.getCurrentPage()+1%>'">&gt;</button>
        	<%} %>
        </div>
	</div>
	<script>
		$(function(){
			$("#list>tbody>tr").click(function(){
				location.href="<%=contextPath%>/detail.ba?bno="+$(this).children().eq(0).text();
			})
			
		})
	</script>

</body>
</html>
