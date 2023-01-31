<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,com.kh.notice.model.vo.Notice, com.kh.common.model.vo.PageInfo"%>
    
    <%
    
    	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
    	PageInfo pi = (PageInfo)request.getAttribute("pi");
    
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 공지사항 리스트 </title>

<style>
	.innerOuter{
		width:900px;
		margin:auto;  /*가운데 정렬*/
		margin-top:50px;
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
	
	
	<br><br>
		<div class="innerOuter">
			<h1 align="center">공지사항</h1>
			<br>
			
			<a href="<%=contextPath%>/enrollForm.no" style="float:right" class="btn btn-outline-primary">글작성</a>
			     <br>
			     
            <table id="boardList" class="table table-hover">
                <br>
        
        
                <thead align="center">
                    <tr class="table-primary">
                        <th>글번호</th>
                        <th width="400">제목</th>
                        <th>조회수</th>
                        <th>작성일</th>
                    </tr>
                </thead>
                <tbody align="center" class="table-active">
               
                <!-- 공지사항 작성글 뿌리기 예시
                
                	 <tr>
                        <td>1</td>
                        <td width="400">2022 전국 도서관 운영평가 우수도서관 수상</td>
                        <td>57</td>
                        <td>2022-10-31</td>
                     </tr>
                     
                     <tr>
                        <td>2</td>
                        <td width="400">[독서계획서] 당첨자 안내</td>	
                        <td>102</td>
                        <td>2022-10-07</td>
                     </tr>
                     
                     
                     <tr>
                        <td>3</td>
                        <td width="400">E-BOOK 오류 처리 방법</td>
                        <td>21</td>
                        <td>2022-08-05</td>
                     </tr>
                     
                     
                      <tr>
                        <td>4</td>
                        <td width="400">정글북 이용 관련 만족도 및 수요조사</td>
                        <td>10</td>
                        <td>2022-06-28</td>
                     </tr>
                     
                     
                      <tr>
                        <td>5</td>
                        <td width="400">신중년을 위한 가장 쉬운 스마트폰 교육</td>
                        <td>3</td>
                        <td>2022-06-21</td>
                     </tr>
                
                
                
                 -->
                
                	 
          <!-- 리스트가 비어 있을 경우 -->
             
             <%if(list.isEmpty())  {%>

               <tr>
               
               <td colspan="4"> 조회된 공지사항 글이 없습니다. </td>
               
               </tr>

			 <%}else{ %>
			
			<!-- 리스트가 비어 있지 않을 경우  -->
			
			<%for(Notice n :list){ %> 
			
				 <tr>
                    <td><%=n.getBoardNo()%></td>
                    <td><%=n.getBoardTitle()%></td>
                    <td><%=n.getCount() %></td>
                    <td><%=n.getCreateDate() %></td>
                 </tr>
	
				<%} %>
			<%} %>
			
                	 
                
                	
                </tbody>
            </table>
            
            <br>
            
            
            <!--  페이징 바 예시 (부트스트랩)
 
         <nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
    <li class="page-item disabled">
      <a class="page-link">이전</a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
     <li class="page-item"><a class="page-link" href="#">4</a></li>
      <li class="page-item"><a class="page-link" href="#">5</a></li>
    <li class="page-item">
      <a class="page-link" href="#">다음</a>
    </li>
  </ul>
</nav>

 				 -->
 			
 			
 					<div align="center" class="paging-area">
		
		<%if(pi.getCurrentPage()!=1){ %>
		<button class="btn btn-info" onclick="location.href='<%=contextPath%>/list.no?currentPage=<%=pi.getCurrentPage()-1%>'">&lt;</button>
	
				<%}else{ %>
				
				<button class="btn btn-info" disabled>이전</button>
				
				<!-- 이전 &lt;   다음 &gt; -->
		
			<%} %>
			

			<%for (int i = pi.getStartPage(); i <= pi.getEndPage(); i++) {%>
			
			<%if(i==pi.getCurrentPage()){ %>
			
			<button class="btn btn-info" disabled><%=i %></button>
			
				<%}else{%>
				
				
			<button class="btn btn-info" onclick="location.href='<%=contextPath%>/list.no?currentPage=<%=i%>'"><%=i%></button>

			<%}%>
			<%}%>
			
		
			
			<%if(pi.getCurrentPage()!=pi.getMaxPage()){ %>

			<button class="btn btn-info" onclick="location.href='<%=contextPath%>/list.no?currentPage=<%=pi.getCurrentPage()+1%>'">다음</button>
			<%} %>
 
		</div>	 
 				 
 		<br><br><br><br><br>		 
 		
	


</body>
</html>