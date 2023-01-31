<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.kh.member.model.service.MemberService"
    import="com.kh.member.model.vo.Member"
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

.textForm {
  border-bottom: 2px solid #adadad;
  margin: 30px;
  padding: 10px 10px;
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
  background: linear-gradient(125deg,#81ecec,#6c5ce7,#81ecec);
  background-position: left;
  background-size: 200%;
  color:white;
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
	<div class="outer">
		<br>
		<h2 align="center">ID찾기</h2>
		
		<form name="idFind" method="post">
			<div class="textForm">
				<input id="name" name="name" type="text" class="name" placeholder="*이름" required>
			</div>
			<div class="textForm">
                <input id="phone" name="phone" type="text" class="cellphoneNo" placeholder="*전화번호(-)">
            </div>
		<br>
		<div align="center">
                <button type="submit" id="find_id" class="btn" onclick="find();">ID찾기</button>
                <br>
                <button type="reset" class="btn" onclick="history.back();">취소</button>
        </div>
        
		</form>
	</div>
	<script>
		function find() {
			<%
				String name = request.getParameter("name");
				String phone = request.getParameter("phone");
				
				String result = new MemberService().selectMember(name, phone);
		
				/*
					if(result != null) {
					}
				*/
			%>

		}
		if(result != null) {
			alert<%=(result)%>;
		}
		
	</script>
</body>
  
</html>