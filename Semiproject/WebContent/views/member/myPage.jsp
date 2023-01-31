<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">

<style>
	#font{
		font-family: 'Nanum Brush Script', cursive;
		font-size: 18px;
		border: none;
		background: none;
	}
    .outer{
        background-image: url("resources/image/노트.jpg");
		color:black;
		width:500px;
		height: 700px;
		margin:auto;  /*가운데 정렬*/
		margin-top:50px; /*위로부터 50px만큼 여백*/
	}
	
	.outer input{
		border: none;
		background: none;
	}
	
	#mypage-form table {
		margin:auto;
	}
	#mypage-form input {
		margin:5px;
		border:1;
		border-bottom:1 solid black;
	}
</style>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp" %>
	
	<%	
		//menubar를 include 했기 때문에 menubar에서 선언해 놓은 변수 사용 가능 (loginUser객체)
		String userId = loginUser.getUserId();
		String userName = loginUser.getUserName();
		String userNickname = loginUser.getUserNickname();		
		String phone = loginUser.getPhone();
		String email = loginUser.getEmail();
		String genre = loginUser.getGenreNo();
		String address = loginUser.getAddress();
	%>
	
    <div class="outer">
        <br><br><br><br><br>
        <h2 align="center">내 정보</h2>
        <br><r>

        <form action="<%=contextPath%>/update.me" id="mypage-form" method="post">
            <!--아이디,이름,전화번호,이메일,주소,관심사-->
            <!-- table>(tr>td*3)*6 -->
            <table>
                <tr>
                    <td>*아이디</td>
                    <td><input type="text" id="font" name="userId" value="<%=userId%>" required disabled></td>
                    <td></td>
                </tr>
                <tr>
                    <td>*이름</td>
                    <td><input type="text" id="font" name="userName" value="<%=userName%>" required></td>
                    <td></td>
                </tr>
                <tr>
                	<td>*닉네임</td>
                	<td><input type="text" id="font" name="userNickname" value="<%=userNickname%>" required></td>
                    <td></td>                	
                </tr>
                <tr>
                    <td>전화번호</td>
                    <td><input type="text" id="font" name="phone" value="<%=phone%>" placeholder="-포함 입력해주세요"></td>
                    <td></td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td><input type="email" id="font"  value="<%=email%>" name="email"></td>
                    <td></td>
                </tr>
                <tr>
                    <td>선호장르</td>
                    <td><input type="text" id="font"  value="<%=genre%>" name="genre"></td>
                    <td></td>
                </tr>
                <tr>
                    <td>주소</td>
                    <td><input type="text" id="font"  name="address" value="<%=address%>"></td>
                    <td></td>
                </tr>
    
            </table>			
			<br><br>
			<div align="center">
				<button id="font" type="submit">정보변경</button>
				<button id="font" type="button" data-toggle="modal" data-target="#deleteForm">회원탈퇴</button>
				<button id="font" type="button" onclick="myBook();"> 내도서</button>	
				
				
			</div>
        </form>
		<br><br>
    </div>

	<!-- 회원탈퇴 모달용 div  -->
	<div class="modal" id="deleteForm">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">회원 탈퇴</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	        <b>탈퇴 후 복구가 불가능합니다. <br> 정말로 탈퇴하시겠습니까? </b> <br><br>
	        
	        <form action="<%=contextPath %>/delete.me" method="post">
       			<!-- 데이터 숨겨서 보내기 -->
       			<!-- <input type="hidden" name="userId" value="<%=userId %>"> -->
	        	<table>
	        		<tr>
	        			<td>비밀번호</td>
	        			<td><input type="password" name="userPwd" required></td>
	        		</tr>
	        	</table>
				<br>
				<button type="submit" class="btn btn-danger">탈퇴하기</button>	        
	        </form>
	      </div>
	    </div>
	  </div>
	</div>
	
	<script>
		function myBook() {
			location.href="<%=contextPath%>/myBook.me"
		}
	</script>
	



</body>
</html>