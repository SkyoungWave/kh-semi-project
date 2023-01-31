<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <!-- <link rel="stylesheet" href=""> -->
	  <!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	  
	  
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
	  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
 
 <style>
    tr, td{
      border: 0px solid none; 
    }
   
    #main-title {
        color:black;
        font-size:16pt;
        font-weight:bold;

    }
  
    #sub-title {
        color:black;
        font-size:10pt;
    }
  
     #middle-title {
        color:black;
        font-size:13pt;
        font-weight:bold;
    }

    k:hover {
      text-decoration: none;
      color: #9354ED
    }

    #area1{
      width: 500px;
      height: 340px;
      padding: 20px;
      border-radius: 10px;
      border: 1px solid rgb(214, 214, 214);
      background-color: rgb(230, 230, 230);
      /* float: left; */
    }

    #area2{
      width: 500px;
      height: 340px;
      padding: 50px;
      margin-left: 20px;
      border-radius: 10px;
      border: 1px solid rgb(214, 214, 214);
      background-color: rgb(230, 230, 230);
      /* float: left; */
    }

    #area3{
      /* margin-left: 400px; */
      
      margin-top: 100px;
    }

    /* #footer1{
      width: 1020px;
      background-color: rgb(53, 53, 53);
      color: aliceblue;
    } */
    
    .footer1{
      font-size: 10px;
      font-weight: 500;
    }

    .btn {
      width: 100px;
      margin: 5px; 
    }
    
    </style>
    
    
</head>
<body>
	<%@include file="../common/mainTwo.jsp" %>

	<!-- <div align="center"><img src="css.css/books-g1bee27431_19203d343.jpg"></div> -->
	
	

   <!---------------------------------- 이름, 핸드폰 번호로 찾기 ----------------------------------->

        
        
    <form action="<%=contextPath %>/searchForm2.me" method="post" id="search-form">
    
    
    <div align="center" id="area3">

      <div align="center" id="area1">
        <table>
            <br><br>
            <tr>
              <td>
                <div id="main-title"> <i class="glyphicon glyphicon-user"></i> &nbsp; 아이디 찾기 &nbsp;&nbsp;</div>
                <div id="sub-title"  style="color: rgb(110, 110, 110);">  |&nbsp;&nbsp;이름, 핸드폰번호로 아이디 찾기 </div>
              </td>
            </tr>
          
            <tr>
              <td>
                <br>
              <table width="300px" height="30px" border="0"
                style="margin-top: 3%; color: black; font-size: 18px;">
                <tr>
                <!-- <td>&nbsp;&nbsp; <img src="../img/check.png" height="30px"> -->
                </td>
                <td style="font-size: x-small; color: rgb(87, 158, 178);">* 회원정보에 등록한 내용과 동일하게 입력해주세요.</td>
                </tr>
              </table>
              </td> 
            </tr>

            <tr>
              <td>
              <table width="380px" height="70px" align="center" border="0"
                style="font-size: 16px;">
                <tr>
                  
                <td>이름</td>
                <td><input type="text" name="userName" id="userName" style="width: 300px"></td>
                </tr>
                
                <tr>
                <td>휴대폰</td>
                <td><input type="text" name="phone" id="phone" style="width: 300px"></td>
        
                </tr>
              </table>
              </td>
            </tr>

            <tr>
              <td>
              <table width="100px" height="10px" border="0"
                style="margin-top: 3%;" align="center">
                <tr>
                <td><input type="submit" class="btn btn-info" value="찾기" align="center" style="cursor: pointer;" onClick="id_search1()"></td>
                <td><input type="reset" class="btn btn-secondary" value="취소" align="center" style="cursor: pointer;"  onClick="cancle()"></td>
                </tr>
                  <br>
              </table>
              </td>
            </tr>
      
        </table>
      </div>
    </div>



    
   <!---------------------------------- 하단 네비바 ----------------------------------->


    <br><br><br><br><br><br><br><br>
    

  
	  <tr>
		  <td><br>
		  	<table width="750px"  height="0"  border="1" align="center"></table>
		  </td>
	  </tr><br>


    <br><br><br><br><br><br><br><br>
  
	
	  <table width="450px"  height="0"  border="0" align="center" style="font-size:16px;" >
	    <tr>
	        <td class="footer1" align="center" onClick="loginmenu()" style="cursor:pointer"> 로그인</td>
	        <td class="footer1" align="center">|</td>
	        <td class="footer1" align="center" onClick="joinmenu()" style="cursor:pointer">회원가입</td>
	        <td class="footer1" align="center">|</td>
	        <td class="footer1" align="center" onClick="id_searchmenu()" style="cursor:pointer">아이디 찾기</td>
	        <td class="footer1" align="center">|</td>
	        <td class="footer1" align="center" onClick="pw_searchmenu()" style="cursor:pointer">비밀번호 찾기</td>
	    </tr>
	  </table>

  

  </form>
  <br><br><br>
  
 
 <!---------------------------------- 자바 스크립트 ----------------------------------->

    <script>

          function id_search1(){
        	  
              var userName = document.getElementById("userName").value;
              var phone = document.getElementById("phone").value;
              
              console.log(userName);
              console.log(phone);
              
          }

    </script>
    
    
    
    
    
    
  </body>
  </html>