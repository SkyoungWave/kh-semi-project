<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList
			    				,com.kh.qnaBoard.model.vo.QnaBoard
			    				,com.kh.common.model.vo.PageInfo"%>
<%
	//list와 pi 꺼내기
	ArrayList<QnaBoard> list = (ArrayList<QnaBoard>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
%>
<!DOCTYPE html>
<html>
<head>	
<meta name="viewport" content="width=device-width, initial-scale=1" charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.css">
<style>
    .outer{
		background:white;
		color:white;
		width:1000px;
		height: 1000%;
		margin:auto;  /*가운데 정렬*/
		margin-top:50px; /*위로부터 50px만큼 여백*/
	}
    #list-area{
        border: 1px solid white;     
        text-align: center;
        width: 100%;
   		height: 100%;
    }
    #list-area>tbody>tr:hover{
        background-color: gray;
        cursor: pointer;
    }
    #qlthead{
    	background-color: #6983ec;
    }


 </style>
</head>
<body>
	<!-- include -->
    <%@include file="/views/common/menubar.jsp" %>
    <div class="outer">
        <br>
        <h2 align="center">Q&A게시판</h2>
        <br>
        <!-- 공지사항은 관리자만 작성이 가능하기 때문에 해당 조건을 추가해줘야한다. -->
        <!-- 로그인되어있는 회원인지 확인  -->
        <%if(loginUser != null){%>
        <div align="center">
        	<!-- 버튼에는 a태그와 같이 경로이동 속성인 href 속성이 없기때문에 이벤트로 추가해서 작성한다. -->
        	<!-- <button onclick="location.href='/jsp/enrollForm.no'">글작성</button> -->
        	<a href="<%=contextPath%>/enrollForm.qbo" class="btn btn-outline-primary">글 작성</a>
        	<!-- a태그를 버튼모양으로 보이게 부트스트랩의 클래스를 이용한다. -->
        </div>
        <br>
        <%} %>
        <table class="table table-hover" id="list-area" >
            <thead id='qlthead'>
                <tr>
                    <th width="100">글번호</th>
                    <th width="100">카테고리</th>
                    <th width="330">제목</th>
                    <th width="130">작성자</th>
                    <th width="90">조회수</th>
                    <th width="130">작성일</th>
                </tr>
            </thead>
            <tbody id='qltbody'>
            	<%if(list.isEmpty()) {%>
            	<tr>
            		<td colspan="6">존재하는 공지사항이 없습니다.</td>
            	</tr> 	
            	
            	<%}else{%>
				   		<%for(QnaBoard b : list) {%>
			     <tr>
                    <td><%=b.getQnaBoardNo() %></td>
                    <td><%=b.getQnaCategory() %></td>
                    <td><%=b.getQnaBoardTitle() %></td>
                    <td><%=b.getQnaBoardWriter() %></td>
                    <td><%=b.getCount() %></td>
                    <td><%=b.getCreateDate() %></td>
			   			 </tr>
			             <%}%>
	            <%}%>
            </tbody>
        </table>
        <script>
        console.log($(this).children().eq(0).text());
        	$(function(){
        		$("#list-area>tbody>tr").click(function(){
        			location.href="<%=contextPath%>/detail.qbo?qbno=" + $(this).children().eq(0).text();
        		})
        	});
        </script>
        <br><br>
        <!-- 페이징바 -->
        <div align="center" class="paging-area">
        	<%if(pi.getCurrentPage() != 1) {%>
        	<button class="btn btn-outline-primary"  onclick="location.href='<%=contextPath%>/qnaList.bo?currentPage=<%=pi.getCurrentPage()-1%>'">previous</button>
        	<%}else{ %>
        	<button class="btn btn-outline-primary"  disabled>&lt;</button>
        	<%} %>
        	
        	 <%for(int i=pi.getStartPage(); i<=pi.getEndPage(); i++) {%>
        	 	<%if(i==pi.getCurrentPage()) {%>
        	 	<button class="btn btn-outline-primary" disabled><%=i %></button>
        	 	<%}else{ %>
        			 <button class="btn btn-outline-primary" onclick="location.href='<%=contextPath%>/qnaList.bo?currentPage=<%=i%>'"><%=i%></button>
				<%} %>        	
        	 <%} %>
        	
        	 <%if(pi.getCurrentPage() != pi.getMaxPage()) {%>
        	<button class="btn btn-outline-primary"  onclick="location.href='<%=contextPath%>/qnaList.bo?currentPage=<%=pi.getCurrentPage()+1%>'">next</button>
        	<%} %>
        </div>
        <br><br>
    </div>
</body>
</html>


