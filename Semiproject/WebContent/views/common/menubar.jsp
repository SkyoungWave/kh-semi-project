<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.member.model.vo.Member"%>
<%
	//context root(path) : 고정값이 아닌 메소드를 통해 얻어오기	
	String contextPath = request.getContextPath();

	//로그인 성공시 session에 담아놓은 loginUser 꺼내기
	Member loginUser = (Member)session.getAttribute("loginUser");
	//로그인 전 loginUser == null
	//로그인 후 loginUser == 로그인한 회원 정보를 담은 Member 객체
	
	//로그인 성공시 session에 담아놓은 알림 메세지도 꺼내주기 
	String alertMsg = (String)session.getAttribute("alertMsg");
	
	//서비스 요청 전 : null
	//서비스 요청 후 : 해당서비스에서 넣어놓은 알림  메세지
	
	//쿠키 꺼내기
	Cookie[] cookies = request.getCookies();
	//쿠키에 저장된 아이디가 있으면 사용자 아이디입력란에 넣어줄 아이디 변수
	String id = null;
	
	if(cookies!=null) {
		//반복문을 사용하여 쿠키배열에 담긴 쿠키중 내가 원하는 쿠키가 있는지 비교하기
		for(int i=0; i<cookies.length; i++) {
			//반복문이 순차적으로 접근하며 접근된 쿠키의 이름이 userId라면
			if(cookies[i].getName().equals("userId")) {
				id=cookies[i].getValue(); //사용자가 입력했던 userId를 꺼내 넣기				
			}
		}
	}	
%>    
    

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>fg</title>
  <link rel="icon" href="./favicon.png" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
  <!--Google APIs-->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Material+Icons" rel="stylesheet" />
  <link href="https://fonts.googleapis.com/css2?family=Material+Icons+Outlined" rel="stylesheet" />
  <link rel="stylesheet" href="./css/main.css">
  <!-- Swiper.js -->
  <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
  <script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.9.1/gsap.min.js" integrity="sha512-H6cPm97FAsgIKmlBA4s774vqoN24V5gSQL4yBTDOY2su2DeXZVhQPxFK4P6GPdnZqM9fg1G3cMv5wD7e6cFLZQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.9.1/ScrollToPlugin.min.js" integrity="sha512-agNfXmEo6F+qcj3WGryaRvl9X9wLMQORbTt5ACS9YVqzKDMzhRxY+xjgO45HCLm61OwHWR1Oblp4QSw/SGh9SA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.8/ScrollMagic.min.js" integrity="sha512-8E3KZoPoZCD+1dgfqhPbejQBnQfBXe8FuwL4z/c8sTrgeDMFEnoyTlH3obB4/fV+6Sg0a0XF+L/6xS4Xx1fUEg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script defer src="./js/main.js"></script>
  
  
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  
  
  
</head>
<style>
  /*COMMON*/
body {
  font-family: 'Nanum Gothic', sans-serif;
  font-size: 16px;
  font-weight: 400;
  line-height: 1.4;
  color: #333;
}
a {
  text-decoration: none;
}
img {
  /* img(인라인 요소) 하단에 Baseline 공백을 제거 */
  display: block;
}

/*INNER*/
.inner {
  width: 1100px;
  margin: 0 auto;
  position: relative;
}

/*BUTTON*/
.btn {
  width: 130px;
  padding: 10px;
  border: 2px solid #333;
  border-radius: 4px;
  box-sizing: border-box;
  color: #333;
  font-size: 16px;
  font-weight: 700;
  text-align: center;
  cursor: pointer;
  display: block;
  transition: .4s;
}
.btn:hover {
  background-color: #333;
  color: #FFF;
}
.btn.btn--reverse {
  background-color: #333;
  color: #FFF;
}
.btn.btn--reverse:hover {
  background-color: transparent;
  color: #333;
}
.btn.btn--brown {
  color: #592B18;
  border-color: #592B18;
}
.btn.btn--brown:hover {
  color: #FFF;
  background-color: #592B18;
}
.btn.btn--gold {
  color: #D9AA8A;
  border-color: #D9AA8A;
}
.btn.btn--gold:hover {
  color: #FFF;
  background-color: #D9AA8A;
}
.btn.btn--white {
  color: #FFF;
  border-color: #FFF;
}
.btn.btn--white:hover {
  color: #333;
  background-color: #FFF;
}

/*BACK TO POSITION*/
.back-to-position {
  opacity: 0;
  transition-duration: 1s;
}
.back-to-position.to-left {
  transform: translateX(150px);
}
.back-to-position.to-right {
  transform: translateX(-150px);
}
.show .back-to-position {
  opacity: 1;
  transform: translateX(0);
}
.show .back-to-position.delay-1 { transition-delay: .3s; }
.show .back-to-position.delay-2 { transition-delay: .6s; }
.show .back-to-position.delay-3 { transition-delay: .9s; }


/*HEADER*/
header {
  width: 100%;
  position: fixed;
  top: 0;
  z-index: 9;
  background-color: #F6F5F0;
  border-bottom: 1px solid #c8c8c8;
}
header > .inner {
  height: 120px;
}
header .logo {
  height: 75px;
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  margin: auto;
}
header .sub-menu {
  position: absolute;
  top: 10px;
  right: 0;
  display: flex;
}
header .sub-menu ul.menu {
  font-family: Arial, sans-serif;
  display: flex;
}
header .sub-menu ul.menu li {
  position: relative;
}
header .sub-menu ul.menu li::before {
  content: "";
  width: 1px;
  height: 12px;
  background-color: #e5e5e5;
  position: absolute;
  top: 0;
  bottom: 0;
  margin: auto;
}
header .sub-menu ul.menu li:first-child::before {
  display: none;
}
header .sub-menu ul.menu li a {
  padding: 11px 16px;
  display: block;
  font-size: 13px;
  color: #656565;
}

header .sub-menu ul.menu li button{
	border: none;
	font-size: 13px;
	padding: 11px 16px;
}



header .sub-menu ul.menu li a:hover {
  color: #000;
}
header .sub-menu ul.menu li input{
  display: inline;
}
header .sub-menu .search {
  position: relative;
  height: 34px;
}
header .sub-menu .search input {
  width: 36px;
  height: 34px;
  padding: 4px 10px;
  border: 1px solid #ccc;
  box-sizing: border-box;
  border-radius: 5px;
  outline: none;
  background-color: #fff;
  color: #777;
  font-size: 12px;
  transition: width .4s;
}
header .sub-menu .search input:focus {
  width: 190px;
  border-color: #EA9926;
}
header .sub-menu .search .material-icons {
  height: 24px;
  position: absolute;
  top: 0;
  bottom: 0;
  right: 5px;
  margin: auto;
  transition: .4s;
}
header .sub-menu .search.focused .material-icons {
  opacity: 0;
}
header .main-menu {
  position: absolute;
  bottom: 0;
  right: 0;
  z-index: 9;
  display: flex;
}
header .main-menu .item .item__name {
  padding: 10px 20px 34px 20px;
  font-family: Arial, sans-serif;
  font-size: 13px;
}
header .main-menu .item:hover .item__name {
  background-color: #2C2A29;
  color: #EA9926;
  border-radius: 6px 6px 0 0;
}
header .main-menu .item .item__contents {
  width: 100%;
  position: fixed;
  left: 0;
  display: none;
}

header .main-menu .item:hover .item__contents {
  display: block;
}
header .main-menu .item .item__contents .contents__menu {
  background-color: green;
}
header .main-menu .item .item__contents .contents__menu > ul {
  padding: 20px 0;
  display: flex;
}
header .main-menu .item .item__contents .contents__menu > ul > li {
  width: 220px;
}
header .main-menu .item .item__contents .contents__menu > ul > li h4 {
  padding: 3px 0 12px 0;
  font-size: 14px;
  color: #fff;
}
header .main-menu .item .item__contents .contents__menu > ul > li ul li {
  padding: 5px 0;
  font-size: 12px;
  color: white;
  cursor: pointer;
}
header .main-menu .item .item__contents .contents__menu > ul > li ul li:hover {
  font-size: large;
  color: #EA9926;
}



/*VISUAL*/
.visual {
  /* margin-top: 120px; */
  background-image: url("resources/image/정글북.jpg");
  background-position: center;
}
.visual .inner .fade-in a {
  position: absolute;
  top: 301px;
  left: 100px;
  z-index: 2;

}
.visual .inner {
  height: 646px;
}
.visual .title {
  position: absolute;
  top: 40px;
  left: -10px;
}
.visual .title .btn {
  position: absolute;
  top: 230px;
  left: 148px;
}
.visual .cup1.image {
  position: absolute;
  bottom: 0;
  right: -47px;
}
.visual .cup2.image {
  position: absolute;
  top: 40px;
  right: 60px;
}
.visual .cup3.image {
  position: absolute;
  bottom: 0;
  right: 162px;
}
.visual .cup4.image {
  position: absolute;
  top: 186px;
  right: 412px;
}
.visual .cup5.image{
  position: absolute;
  top: 120px;
  left: -200px;
}
.visual .spoon {
  position: absolute;
  bottom: 100px;
  left: 275px;
}
.visual .cup6.image{
  position: absolute;
  bottom: 0px;
  left: -60px;
}
.visual .cup7.image{
  position: absolute;
  top: 120px;
  left: -200px;
}
.visual .cup8.image{
  position: absolute;
  top: 120px;
  left: -200px;
}
.visual .fade-in {
  opacity: 0;
}


/*NOTICE*/
.notice {
  position: relative;
}
.notice .bg-left {
  width: 100%;
  height: 100%;
  background-color: #333;
  position: absolute;
  top: 0;
  left: 0;
}
.notice .inner {
  height: 62px;
  display: flex;
}
.notice .inner__left {
  width: 100%;
  background-color: #333;
  display: flex;
  align-items: center;
}
.notice .inner__left h2 {
  color: #fff;
  font-size: 25px;
  font-weight: 700;
  margin-right: 20px;
}

/* PROMOTION */
.promotion {
  display: flex;
  justify-content: center;
  background-color: #f6f5ef;
  overflow: hidden;
  position: relative;
  height: 663px;
  transition: height .4s;
}
.promotion.hide {
  height: 0;
}
.promotion .swiper {
  /* 819px 슬라이드 3개와 그 사이 여백 10px씩 = 2477px */
  width: calc(819px * 3 + 10px * 2);
  height: 553px;
  flex-shrink: 0;
}
.promotion .swiper-slide {
  position: relative;
  opacity: .5;
  transition: opacity 1s;
}
.promotion .swiper-slide-active {
  opacity: 1;
}
.promotion .swiper-slide .btn {
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  margin: auto;
}
.promotion .swiper-pagination {
  bottom: 40px !important;
  z-index: 1;
}
.promotion .swiper-pagination .swiper-pagination-bullet {
  background-color: transparent;
  background-image: url("../images/promotion_slide_pager.png");
  width: 13px;
  height: 12px;
  margin-right: 6px;
}
.promotion .swiper-pagination .swiper-pagination-bullet:last-child {
  margin-right: 0;
}
.promotion .swiper-pagination .swiper-pagination-bullet-active {
  background-image: url("../images/promotion_slide_pager_on.png");
}
.promotion .swiper-button-prev,
.promotion .swiper-button-next {
  width: 42px;
  height: 42px;
  border: 2px solid #333;
  border-radius: 50%;
  top: 300px;
  z-index: 1;
  color: #333;
}
.promotion .swiper-button-prev {
  left: 50%;
  margin-left: -480px;
}
.promotion .swiper-button-next {
  right: 50%;
  margin-right: -480px;
}
.promotion .swiper-button-prev:hover,
.promotion .swiper-button-next:hover {
  background-color: #333;
  color: #fff;
}
.promotion .swiper-button-prev::after,
.promotion .swiper-button-next::after {
  display: none;
}

/*AWARDS*/
.awards {
  background-color: #272727;
}
.awards .inner {
  padding: 40px 0;
}
.awards .swiper-button-prev,
.awards .swiper-button-next {
  width: 42px;
  height: 42px;
  border: 2px solid #fff;
  border-radius: 50%;
  color: #fff;
  position: absolute;
  opacity: .3;
}
.awards .swiper-button-prev {
  left: -100px;
}
.awards .swiper-button-next {
  right: -100px;
}
.awards .swiper-button-prev:hover,
.awards .swiper-button-next:hover {
  background-color: #fff;
  color: #333;
}
.awards .swiper-button-prev::after,
.awards .swiper-button-next::after {
  display: none;
}


/*FOOTER*/
footer {
  background-color: #272727;
  border-top: 1px solid #333;
}
footer .inner {
  padding: 40px 0 60px 0;
}
footer .menu {
  display: flex;
  justify-content: center;
}
footer .menu li {
  position: relative;
}
footer .menu li::before {
  content: "";
  width: 3px;
  height: 3px;
  background-color: #555;
  position: absolute;
  top: 0;
  bottom: 0;
  right: -1px;
  margin: auto;
}
footer .menu li:last-child::before {
  display: none;
}
footer .menu li a {
  display: block;
  color: #CCC;
  font-size: 12px;
  font-weight: 700;
  padding: 15px;
}
footer .menu li a.orange {
  color: #EA9926;
}
footer .btn-group {
  margin-top: 20px;
  display: flex;
  justify-content: center;
}
footer .btn-group .btn {
  font-size: 12px;
  margin-right: 10px;
}
footer .btn-group .btn:last-child {
  margin-right: 0;
}
footer .info {
  margin-top: 30px;
  text-align: center;
}
footer .info span {
  margin-right: 20px;
  color: #999;
  font-size: 12px;
}
footer .info span:last-child {
  margin-right: 0;
}
footer .copyright {
  color: #999;
  font-size: 12px;
  text-align: center;
  margin-top: 12px;
}
footer .logo {
  margin: 30px auto 0;
}

.promotion .swiper-slide img{
	width: 250px
}


/*SCROLL TO TOP*/
#to-top {
  position: fixed;
  bottom: 30px;
  right: 30px;
  z-index: 9;
  width: 42px;
  height: 42px;
  background-color: #333;
  color: #fff;
  border: 2px solid #fff;
  border-radius: 10px;
  cursor: pointer;
  display: flex;
  justify-content: center;
  align-items: center;
}

.promotion p {
  margin: -1%;
}

.items {
    padding: 15px;
    padding-bottom: 40px;    
    background-color: #f9f9f9; 
}
.items img {
    max-width: 100%;
    display: block;
}
.items ul {
    background-color: white;
    margin-bottom: 20px;
}
.items li:nth-child(2) { padding: 13px 1px 1px 1px;}
.items li:last-child { padding: 0px 10px 10px 10px;}
.items::after {
    content: "";
    clear: both;
    display: block;
}
[class*="col_"] {  float: left; }
@media only screen and (min-width: 1200px) {
  .box {
        max-width: 1170px;
        margin: 0 auto;
        position: relative;
  }
  /* .item { padding-right: 15px; } */
  .item { padding-right: 15px; }

}

</style>
<body>
<!-- HEADER -->
<header>
	<script>
		//script 태그 내에도 스크립틀릿과 같은 jsp 요소를 사용할 수 있다.
		//alert메세지가 있으면 띄워주고 없으면 안띄워주면 됨 
		
		var msg = "<%=alertMsg%>";
		
		if(msg != "null"){
			alert(msg);
			//알림창을 띄워준 후에 session에 담긴 alertMsg를 지워야한다
			//하지않으면 새로고침(페이지 리로딩)될때마다 alert창이 띄워지게 된다
			<%session.removeAttribute("alertMsg");%>
		}
	</script>
  <div class="inner">
    <a href="/Semiproject" class="logo">
      <img src="resources/image/monkey.png" alt="독서" />
    </a>
    <div class="sub-menu">
      <ul class="menu">
        <li>
        <%if(loginUser==null) {%>
              <form action="/Semiproject/login.me" method="post" id="login-form">
	          	  <%if(id == null) {%>
	              <input type="text" id="id" name="userId" required placeholder="아이디">
	              <%} else {%>
	              <td><input type="text" name="userId" value="<%=id %>"required></td>
	              <%} %>
	              <input type="password" id="pwd" name="userPwd" required placeholder="비밀번호">
	              <button type="submit">로그인</button>
	              <button type="button" onclick="enrollPage();">회원가입</button>
         	  </form>
        </li>
        <%}else{ %> 	 
        <li>
        	<a href="<%=contextPath%>/logout.me">로그아웃</a>
        </li>
        <li>        
          <a href="<%=contextPath%>/mypage.me">내정보</a>
        </li>
        <%} %>
        
        <li>
          <a href="javascript:void(0)">고객센터</a>
        </li>
      </ul>
      <div class="search">
        <input type="text" />
        <span class="material-icons">search</span>
      </div>
    </div>
    <ul class="main-menu">
      <li class="item">
        <div class="item__name">게시판</div>
        <div class="item__contents">
          <div class="contents__menu">
            <ul class="inner">
              <li>
                <h4>공지사항</h4>
                <ul>
            		<li><a href="<%=contextPath%>/list.no">공지사항</a></li> 
                </ul>
              </li>
              <li>
                <h4>Q&A</h4>
                <ul>
                  <li><a href="<%=contextPath %>/qnaMain.bo?currentPage=1">Q&A</a></li>
                </ul>
              </li>
              <li>
                <h4>도서신청</h4>
                <ul>
                   <li>><a href="<%=contextPath%>/list.ba?currentPage=1">도서신청</a></li>
                </ul>
              </li>
            </ul>
          </div>
        </div>
      </li>
      <li class="item">
        <div class="item__name">MENU</div>
        <div class="item__contents">
          <div class="contents__menu">
            <ul class="inner">
              <li>
                <h4>도서</h4>
                <ul>
                  <li>인기별</li>
                  <li>추천별</li>
                  <li>장르별</li>
                </ul>
              </li>
            </ul>
          </div>
        </div>
      </li>
      <li class="item">
        <div class="item__name">NEW</div>
        <div class="item__contents">
          <div class="contents__menu">
            <ul class="inner">
              <li>
                <h4>NEW</h4>
                <ul>
                  <li>NEW</li>
                  <li>NEW</li>
                  <li>NEW</li>
                  <li>NEW</li>
                  <li>NEW</li>
                </ul>
              </li>
              <li>
                <h4>NEW</h4>
                <ul>
                  <li>NEW</li>
                  <li>NEW</li>
                  <li>NEW</li>
                  <li>NEW</li>
                  <li>NEW</li>
                </ul>
              </li>
              <li>
                <h4>NEW</h4>
                <ul>
                  <li>NEW</li>
                  <li>NEW</li>
                </ul>
              </li>
            </ul>
          </div>
        </div>
      </li>
    </ul>
  </div>
</header>
<script>
function enrollPage(){
   		//location.href = "<%=contextPath%>/views/member/memberEnrollForm.jsp";
   		//웹 애플리케이션의 디렉토리 구조가 url에 노출되면 보안에 취약하다.
       		
   		//단순한 정적 페이지 이동이여도 해당 페이지로 바로 이동하지 않고
   		//servlet을 거쳐서 서블릿 매핑값으로 보여지게 할것.
  		location.href="<%=contextPath%>/enrollForm.me";
   	}
</script>
</body>
</html>