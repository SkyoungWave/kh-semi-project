<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.qnaBoard.model.vo.*"%>
    
<%
	QnaBoard b = (QnaBoard)request.getAttribute("b");
	Attachment at = (Attachment)request.getAttribute("at");
	
	
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{
		background: white;
		align:center;
		border: solid 1px rgb(212,212,210);
		color:black;
		width:1000px;
		height: 1000px;
		margin:auto;  /*가운데 정렬*/
		margin-top:200px; /*위로부터 50px만큼 여백*/
	}
	
	#detail-area{
		border: 1px solid black;
		width: 900px;
		height: auto;
	}
	#detail-area>th>tr>td{
		border: 1px solid black;
	
	}
	
    thead {
		  font-weight: bold;
		  color: gray;
		  background: white;
}	
	.bbb{
		border:1px solid black;
		border-radius:20px;
		background-color: white;
		width: 100px;
		height: 30px;	
	}
	.bbb:hover{
		background-color:gray;
		color:white;	
	}
	.bbb2{
		border:1px solid black;
		border-radius:20px;
		background-color: white;
		width: 50px;
		height: 30px;	
	}
	.bbb2:hover{
		background-color:gray;
		color:white;	
	}

	
	
</style>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp" %>
	
	<div align="center" class="outer">
		<br>
		<h2 align="center">게시글 상세 보기</h2>
		<br><br><br><br><br>
		<table id="detail-area" align= "center" border="1">
			<tr>
				<thead>
				<th width="40px" colspan="2">카테고리</th>
				
				<%if(b.getQnaCategory()==null){ %>
				<%System.out.println("카테고리없음"); %>
				<%}else{ %>
				<td><%=b.getQnaCategory() %></td>
				<%} %>
			</tr>	
			<tr>
				<th colspan="2">제목</th>
				<td><%=b.getQnaBoardTitle() %></td>
			</tr>		
		
			<tr>
				<th colspan="2">작성자</th>
				<td><%=b.getQnaBoardWriter() %></td>
				<th width="100px" >작성일</th>
				<td colspan="2"><%=b.getCreateDate() %></td>
			</tr>
			</thead>
			<tr>
				<th>내용</th>
				<td colspan="2">
					<p style="height:200px; background-color:white; white-space:pre;"><%=b.getQnaBoardContent() %></p>
						
				</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td colspan="2">
				<%if(at==null) {%>
					첨부파일이 없습니다.
				<%}else{ %>
					<a download="<%=at.getOriginName() %>" href="<%=contextPath %>/<%=at.getFilePath()+at.getChangeName() %>"><%=at.getOriginName() %></a>
				<%} %>
				</td>
			</tr>
		</table>
		<br>
			<div class="button" align="center">
				<button class="bbb" onclick="location.href='<%=contextPath%>/qnaList.bo?currentPage=1'">목록가기</button>
			<!--현재 로그인된 유저의 아이디가 글 작성자와 동일하다면  -->

			<%if(loginUser!=null && loginUser.getUserId().equals(b.getQnaBoardWriter())) {%>
				<button class="bbb" onclick="location.href='<%=contextPath%>/updateForm.qbo?qbno=<%=b.getQnaBoardNo()%>'">수정하기</button>
				<button class="bbb" onclick="location.href='<%=contextPath%>/delete.qbo?qbno=<%=b.getQnaBoardNo()%>'">삭제하기</button>		
			<%} %>
			</div>	
			<div id="reply-area">
			<table border="1" align="center">
				<thead class="reply">
					<tr>
						<th>댓글작성</th>
						<td>
							<textarea id="replyContent" rows="3" cols="70" style="resize:none" placeholder="여러분의 소중한 댓글을 입력해주세요."></textarea>
						</td>		
						<td><button class="bbb" onclick="insertReply();">댓글 작성</button></td>
					</tr>
				</thead>
				<tbody class="replyTbody">
					
				</tbody>
			</table>
		</div>
		
		</div>
		<br><br>
		
		<script>	
		
			$(function(){	
					selectReplyList();				
					let interval = setInterval(selectReplyList,1000);
					clearInterval(interval);
				});
			
			function deleteReply(){
				if (!confirm("삭제를 취소하시겠습니까?")) {
			        return; 
			}	
			
				selectReplyList();
			}

	
			function insertReply(){
				$.ajax({
					url : "rinsert.qbo",
					data : {
						qbno : <%=b.getQnaBoardNo()%>,
						content : $("#replyContent").val()
					},
					type : "post",
					success : function(result){
												
						if(result>0){
							console.log("댓글작성 성공");
							selectReplyList();//댓글목록 갱신
							$("#replyContent").val("");
						}else{
							console.log("댓글작성 실패");
						}
					},
					error : function(){
						console.log("통신 실패");
					}
				});
			}
				
			
			function selectReplyList(){
				$.ajax({
					url : "rlist.qbo",
					data : {qbno : <%=b.getQnaBoardNo()%>},
					success : function(list){
						console.log(list);
						var str ="";
												
										
						for(var i = 0; i < list.length;i++){
							//여기 뿌려주는 거 해야됨.
							console.log($(this).parent().siblings("input").val());

							var str1 = list[i].reLevel;
							str +=   "<tr class='test'>";	
					
							if(str1>0){
								for(var j=0;j<str1;j++){
									str += "<td><pre style='margin-left: 5px'>ㄴ</pre></td>";
								}
							}			
							
								str	+= "<input class='replyNo"+i+"'" +"type='hidden' value='"+list[i].replyNo+"'>"
									+ "<td>"+list[i].replyWriter+"</td>"
									+ "<td>"+list[i].replyContent+"</td>"
									+ "<td>"+list[i].createDate+"</td>"
									+ "<td>"+"<button class='bbb2' id='updateformb'>수정 </button>"+"</td>"
									+ "<td>"+"<button class='bbb2' id='deleteb'> 삭제 </button>"+"</td>"
									+ "<td>"+"<button class='bbb2' id='replyReplyFormb'> 답글 </button>"+"</td>"			
									+ "</tr>";
						}		
						
						
	
						$(".replyTbody").html(str);
					},
					error : function(){
						console.log("통신 실패");
					}
				});
			}
			
		$(function(){	
				$(".replyTbody").on("click","#deleteb",function(e){
					
				   //console.log($(this).parent().siblings("input").val());
				    //console.log($(this).parents().eq(j).children().val());
			    	console.log($(this).parent().siblings("input").val());

				    
					e.preventDefault();
					
					if (!confirm("삭제하시겠습니까?")) {
					        return;
					    };	
						    $.ajax({
								url : "rdelete.qbo",
								data : {		
									 qbno : $(this).parent().siblings("input").val(),
									//qbno : $(this).closest(".replyNo").find("#replyNo").val(),
									//qbno : $(this).parents().eq(j).children().val(),
								},
								type : "post",
								success : function(result){
															
									if(result>0){
										console.log("댓글삭제 성공");
										selectReplyList();
									}else{
										console.log("댓글삭제 실패");
									}
								},
								error : function(){
									console.log("통신 실패");
								}
							});
			})
		});
		
		
		$(function(){	
			$(".replyTbody").on("click","#updateformb",function(){
			
				   console.log($(this).parent().siblings("input").val());

				
				if (!confirm("수정하시겠습니까?")) {
			        return; 
				}
				
				$.ajax({
					url : "rupdateForm.qbo",
					data : {rbno : $(this).parent().siblings("input").val(),
					},
					type : "post",
					success : function(list){
						
						console.log(list);
						var str ="";
			
						for(var i in list){
							
							str = "<tr>"
									+ "<input id='replyNo"+i+"'"+"type='hidden' value='"+list[i].replyNo+"'>"
									+ "<td>"+list[i].replyWriter+"</td>"
									+ "<td>"+"<textarea id='replyContent2' rows='3' cols='75' style='resize:none' placeholder='댓글을 수정해주세요.'></textarea>"+"</td>"
									+ "<td>"+list[i].createDate+"</td>"
									+ "<td>"+"<button class='btn btn-outline-primary' id='updateinsertb'>수정완료 </button>"+"</td>"
									+ "<td>"+"<button class='btn btn-outline-primary' onclick='deleteReply();'> 취소 </button>"+"</td>"
									+ "</tr>";
						}
						$("#reply-area tbody").html(str);
						
							
					},
					error : function(){
						console.log("통신 실패");
					}
				});   
							 
		})
	});
		
			$(function(){
				$(".replyTbody").on("click","#updateinsertb",function(){

				$.ajax({
					url : "rupdate.qbo",
					data : {
						rbno: $(this).parent().siblings("input").val(),			
						content : $("#replyContent2").val()
					},
					type : "post",
					success : function(result){
												
						if(result>0){
							console.log("댓글수정 성공");
							selectReplyList();//댓글목록 갱신
							$("#replyContent").val("");
						}else{
							console.log("댓글수정 실패");
						}
					},
					error : function(){
						console.log("통신 실패");
					}
					
				});
			})
		}); 
			
			
			$(function(){
				$(".replyTbody").on("click","#replyReplyFormb",function(){
					console.log($(this).parent().siblings("input").val());

					if (!confirm("답글을 다시겠습니까?")) {
				        return; 
					}
					
					   $.ajax({
							url : "rupdateForm.qbo",
							data : {rbno :  $(this).parent().siblings("input").val(),
							},
							type : "post",
							success : function(list){
				
								console.log(list);
								var str ="";
					
								for(var i in list){								
									str = "<tr>"
										+ "<input id='replyNo3' type='hidden' value='"+list[i].replyNo+"'>"
										+ "<td>"+list[i].replyWriter+"</td>"
										+ "<td>"+"<textarea id='replyContent3' rows='3' cols='75' style='resize:none' placeholder='답글을 달아주세요.'></textarea>"+"</td>"
										+ "<td>"+list[i].createDate+"</td>"
										+ "<td>"+"<button class='bbb' id='replyReplyInsertb'>답글완료 </button>"+"</td>"
										+ "<td>"+"<button class='bbb' onclick='deleteReply();'> 취소 </button>"+"</td>"
										+ "</tr>";
					
								}
								$("#reply-area tbody").html(str);
							
							},
							error : function(){
								console.log("통신 실패");
							}
						});   
			
				})	
			});
			
			
			
			$(function(){
				$(".replyTbody").on("click","#replyReplyInsertb",function(){					
				$.ajax({
					url : "rrInsert.qbo",
					data : {
						rbno :  $(this).parent().siblings("#replyNo3").val(),
							//$(this).closest(".replyTbody").find("#replyNo3").val(),
						qbno : <%=b.getQnaBoardNo()%>,
						content : $("#replyContent3").val()
					},
					type : "post",
					success : function(result){
						
						if(result>0){
							console.log("답댓글작성 성공");
							selectReplyList();//댓글목록 갱신
							$("#replyContent").val("");
						}else{
							console.log("답댓글작성 실패");
						}
					},
					error : function(){
						console.log("통신 실패");
					}
					
				});
				})
		});

			
		</script>
		
		<br><br>
	</div>
</body>
</html>