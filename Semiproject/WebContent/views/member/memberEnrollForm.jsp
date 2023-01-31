<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<style>
* {
  margin: 0px;
  padding: 0px;
  text-decoration: none;
  font-family:sans-serif;

}

body {
  background-image:#34495e;
  width: 40%;
  margin: auto;
}

.joinForm {
  position:absolute;
  width:400px;
  height:400px;
  padding: 30px, 20px;
  background-color:#FFFFFF;
  text-align:center;
  top:40%;
  left:50%;
  transform: translate(-50%,-50%);
  border-radius: 15px;
}

.joinForm h2 {
  text-align: center;
  margin: 30px;
}

.textForm {
  border-bottom: 2px solid #adadad;
  margin: 30px;
  padding: 10px 10px;
}


.id{
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.pw {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.name {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.email {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.nickname {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.address{
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.genre{
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.cellphoneNo {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.btn {
  position:relative;
  left:40%;
  transform: translateX(-50%);
  margin-bottom: 40px;
  width:80%;
  height:40px;
  <!--background: linear-gradient(125deg,#81ecec,#6c5ce7,#81ecec);
  background-position: left;
  background-size: 200%;
  <!--color:white;-->
  color:black;
  font-weight: bold;
  border:none;
  cursor:pointer;
  transition: 0.4s;
  display:inline;
}

.btn:hover {
  background-position: right;
}
</style>

</head>
<body>
    <!-- include로 menubar 가져올것 -->
    <!-- ../ : 현재 폴더로부터 상위 폴더로 한단계 이동 -->

    <div class="outer">

        <br>
        <h2 align="center">회원가입</h2>

        <form action="<%=request.getContextPath()%>/insert.me" method="post" id="enroll-form">
        
              <div class="textForm">
                <input id="userId" name="userId" type="text" class="id" maxlength="12" placeholder="*숫자,영소문자 조합 5~12자리" required>
                <button type="button" id="btn" onclick="check()">확인</button>                                         
              </div>
              
              <div class="textForm">
                <input id="userPwd" name="userPwd" type="password" class="pw" placeholder="*(특,소,숫,대)비밀번호 8~15자리" required>
              </div>
              
              <div class="textForm">
                <input name="userName" type="text" class="name" placeholder="*이름" required>
              </div>
               
              <div class="textForm">
                <input name="userNickname" type="text" class="nickname" placeholder="닉네임">
              </div>
              
              <div class="textForm">
                <input name="phone" type="text" class="cellphoneNo" placeholder="전화번호(-)">
              </div>
              
              <div class="textForm">
                <input name="email" type="text" class="email" placeholder="이메일">
              </div>
              
              <div class="textForm">
              	<input name="genre" type="text" class="genre" placeholder="선호장르">
              </div>
              
              <div class="textForm">
                <input name="address" type="text" class="address" placeholder="주소">
              </div>
			
			
				
            <br><br>
            <div align="center">
                <button id="signup" type="submit" class="btn" disabled>회원가입</button>
                <br>
                <button type="reset" class="btn">초기화</button>
            </div>
        </form>
       <script>
      
       function check() {
        		
       		var userId = document.getElementById("userId");
        		
        		
      		if((userId.value == "")) {
           		alert("아이디  입력하시오");
           	}
            	
            var idcheck = /^(?=.*[a-z])(?=.*[0-9]).{5,12}$/;
            //var pwdcheck = /^[a-zA-Z0-9[^[]$()|*+?{}\]]{8,15}$/;

            if(!idcheck.test(userId.value)) {
            	alert("아이디 유효한 형식이 아닙니다");
            	
            	const target = document.getElementById("signup");
            	target.disabled = true;
            	
            } else {
            	alert("사용할수 있습니다");
            	
            	const target = document.getElementById("signup");
            	target.disabled = false;
            }
            

        } 	
    </script>
    </div>
     
    
</body>

</html>