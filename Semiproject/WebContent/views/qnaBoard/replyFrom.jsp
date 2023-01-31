<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
	import="com.kh.qnaBoard.model.vo.Reply,java.util.ArrayList"%>
<%
	ArrayList<Reply> list = (ArrayList<Reply>)request.getAttribute("list");
	System.out.println(list);
%>
        <%for(int i=0 ;i<list.size();i++) {%>    
									<tr style='background-color:green'>"
									 <input type='hidden' value=list[i].replyWriter>
									 <td>list[i].replyWriter+"</td>"
									 <td>list[i].replyContent+"</td>"
									 <td>list[i].createDate+"</td>"
									 <td><button class='btn btn-outline-primary' id='updateformb'>수정 </button></td>
									 <td><button class='btn btn-outline-primary' id='deleteb'> 삭제 </button></td>
									 <td><button class='btn btn-outline-primary' id='replyReplyFormb'> 댓글달기 </button></td>"	
									</tr>
                      <%} %>
              
               
    </body>
</html>
