<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
header .sub-menu ul.menu li a:hover {
  color: #000;
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
  z-index: 1;
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
  background-color: #2C2A29;
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
  color: #999;
  cursor: pointer;
}
header .main-menu .item .item__contents .contents__menu > ul > li ul li:hover {
  color: #EA9926;
}

/*VISUAL*/
.visual {
  margin-top: 120px;
  background-image: url("../semi/visual_bg.jpg");
  background-position: center;
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
/* .notice .bg-right {
  width: 50%;
  height: 100%;
  background-color: #f6f5ef;
  position: absolute;
  top: 0;
  right: 0;
} */
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
/* .notice .inner__left .swiper {
  height: 62px;
  flex-grow: 1;
}
.notice .inner__left .swiper .swiper-slide {
  height: 62px;
  display: flex;
  align-items: center;
}
.notice .inner__left .swiper .swiper-slide a {
  color: #fff;
} */
/* .notice .inner__left .notice-more {
  width: 62px;
  height: 62px;
  display: flex;
  justify-content: center;
  align-items: center;
}
.notice .inner__left .notice-more .material-icons {
  color: #fff;
  font-size: 30px;
} */
/* .notice .inner__right {
  width: 30%;
  display: flex;
  justify-content: flex-end;
  align-items: center;
}
.notice .inner__right h2 {
  font-size: 17px;
  font-weight: 700;
}
.notice .inner__right .toggle-promotion {
  width: 62px;
  height: 62px;
  cursor: pointer;
  display: flex;
  justify-content: center;
  align-items: center;
}
.notice .inner__right .toggle-promotion .material-icons {
  font-size: 30px;
} */
/*PROMOTION*/
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


/*REWARDS*/
/* .rewards {
  position: relative;
}
.rewards .bg-left {
  width: 50%;
  height: 100%;
  background-color: #272727;
  position: absolute;
  top: 0;
  left: 0;
}
.rewards .bg-right {
  width: 50%;
  height: 100%;
  background-color: #d5c798;
  position: absolute;
  top: 0;
  right: 0;
}
.rewards .inner {
  background-image: url("../images/rewards.jpg");
  height: 241px;
}
.rewards .btn-group {
  position: absolute;
  right: 0;
  bottom: 24px;
  width: 250px;
  display: flex;
  flex-wrap: wrap;
}
.rewards .btn-group .btn.sign-up {
  margin-right: 10px;
}
.rewards .btn-group .btn.sign-in {
  width: 110px;
}
.rewards .btn-group .btn.gift {
  margin-top: 10px;
  flex-grow: 1;
} */


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
  <div class="inner">
    <a href="/" class="logo">
      <img src="./사자.png" alt="독서" />
    </a>
    <div class="sub-menu">
      <ul class="menu">
        <li>
          <a href="/signin">회원가입</a>
        </li>
        <li>
          <a href="/signin">로그인</a>
        </li>
        <li>
          <a href="javascript:void(0)">마이페이지</a>
        </li>
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
                  <li>공지사항</li>
                </ul>
              </li>
              <li>
                <h4>게시판</h4>
                <ul>
                  <li>게시판</li>
                </ul>
              </li>
              <li>
                <h4>도서</h4>
                <ul>
                  <li>도서</li>
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
                <h4>메뉴</h4>
                <ul>
                  <li>메뉴</li>
                  <li>메뉴</li>
                  <li>메뉴</li>
                  <li>메뉴</li>
                  <li>메뉴</li>
                  <li>메뉴</li>
                  <li>메뉴</li>
                  <li>메뉴</li>
                  <li>메뉴</li>
                </ul>
              </li>
              <li>
                <h4>메뉴</h4>
                <ul>
                  <li>메뉴</li>
                  <li>메뉴</li>
                  <li>메뉴</li>
                  <li>메뉴</li>
                  <li>메뉴</li>
                  <li>메뉴</li>
                  <li>메뉴</li>
                  <li>메뉴</li>
                  <li>메뉴</li>
                </ul>
              </li>
              <li>
                <h4>메뉴</h4>
                <ul>
                  <li>메뉴</li>
                  <li>메뉴</li>
                  <li>메뉴</li>
                  <li>메뉴</li>
                  <li>메뉴</li>
                  <li>메뉴</li>
                  <li>메뉴</li>
                  <li>메뉴</li>
                  <li>메뉴</li>
                </ul>
              </li>
            </ul>
          </div>
        </div>
      </li>
      <li class="item">
        <div class="item__name">STORE</div>
        <div class="item__contents">
          <div class="contents__menu">
            <ul class="inner">
              <li>
                <h4>도서</h4>
                <ul>
                  <li>도서</li>
                  <li>도서</li>
                  <li>도서</li>
                </ul>
              </li>
              <li>
                <h4>도서</h4>
                <ul>
                  <li>도서</li>
                  <li>도서</li>
                  <li>도서</li>
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

<!--VISUAL-->
<section class="visual">
  <div class="inner">
    <div class="title fade-in">
      <img src="./1.jpg" alt="" />
      <a href="javascript:void(0)" class="btn btn--brown">책 보러가기</a>
    </div>
    <div class="fade-in">
      <img src="2.jpg" alt="" class="cup1 image" />
      <img src="./3.jpg" alt="" class="cup2 image" />
      <img src="./4.jpg" alt="" class="cup3 image" />
    </div>
    <div class="fade-in">
      <img src="./5.jpg" alt="" class="cup4 image" />
      <img src="./6.jpg" alt="" class="spoon" />
      <img src="./8.jpg" alt="" class="cup5 image">
    </div>
    <div class="fade-in">
      <img src="./9.jpg" alt="" class="cup6 image" />
      <img src="./10.jpg" alt="" class="cup7 image">
      <img src="./11.jpg" alt="" class="cup8 image" />
    </div>
  </div>
</section>

<!--NOTICE-->
<section class="notice">
  <div class="bg-left"></div>
  <!-- <div class="bg-right"></div> -->
  <div class="inner">
    <div class="inner__left">
      <h2>추천순</h2>
      <!-- <div class="swiper">
        <div class="swiper-wrapper">
          <div class="swiper-slide">
            <a href="javascript:void(0)">공지1</a>
          </div>
          <div class="swiper-slide">
            <a href="javascript:void(0)">공지2</a>
          </div>
          <div class="swiper-slide">
            <a href="javascript:void(0)">공지3</a>
          </div>
          <div class="swiper-slide">
            <a href="javascript:void(0)">공지4</a>
          </div>
        </div>
      </div> -->
      <!-- <a href="javascript:void(0)" class="notice-more">
        <span class="material-icons">add_circle</span>
      </a> -->
    </div>
    <!-- <div class="inner__right">
      <h2>추천</h2>
      <div class="toggle-promotion">
        <div class="material-icons">upload</div>
      </div> -->
    </div>
  </div>
</section>

<!--PROMOTION-->
<section class="promotion">
  <div class="swiper">
      <div class="swiper-wrapper">
      <div class="swiper-slide" align="center">
        <br><br><br>
        <img src="/16.jpg" style="width:250px"/>
        <br><p>책 제목: 도라에몽</p>
        <br><p>저자: 도라에몽</p>
        <a href="javascript:void(0)" class="btn">자세히 보기</a>
      </div>
      <div class="swiper-slide" align="center">
        <br><br><br>
        <img src="/16.jpg"/>
        <br><p>책 제목: 도라에몽</p>
        <br><p>저자: 도라에몽</p>
        <a href="javascript:void(0)" class="btn">자세히 보기</a>
      </div>
      <div class="swiper-slide" align="center">
        <br><br><br>
        <img src="/16.jpg"/>
        <br><p>책 제목: 도라에몽</p>
        <br><p>저자: 도라에몽</p>
        <a href="javascript:void(0)" class="btn">자세히 보기</a>
      </div>
      <div class="swiper-slide" align="center">
        <br><br><br>
        <img src="/16.jpg"/>
        <br><p>책 제목: 도라에몽</p>
        <br><p>저자: 도라에몽</p>
        <a href="javascript:void(0)" class="btn">자세히 보기</a>
      </div>
      <div class="swiper-slide" align="center">
        <br><br><br>
        <img src="/16.jpg"/>
        <br><p>책 제목: 도라에몽</p>
        <br><p>저자: 도라에몽</p>
        <a href="javascript:void(0)" class="btn">자세히 보기</a>
      </div>
    </div>
  </div>
  <div class="swiper-pagination"></div>
  <div class="swiper-button-prev">
    <span class="material-icons">arrow_back</span>
  </div>
  <div class="swiper-button-next">
    <span class="material-icons">arrow_forward</span>
  </div>
</section>

<section class="notice">
  <div class="bg-left"></div>
  <!-- <div class="bg-right"></div> -->
  <div class="inner">
    <div class="inner__left">
      <h2>도서</h2>
    </div>
  </div>
</section>

<!-------------------------->
<section class="items">
  <br><br>
  <div class="box">
      <div class="item col_m_6 col_3">
          <ul>
          <li><img src="/16.jpg"></li>
          <li><h3 align="center">책 제목</h3></li>
          <li><p align="center">조회수<p></li>
          </ul>
      </div>    
      <div class="item col_m_6 col_3">
          <ul>
          <li><img src="/16.jpg"></li>
          <li><h3 align="center">책 제목</h3></li>
          <li><p align="center">조회수<p></li>
          </ul>
      </div> 
      <div class="item col_m_6 col_3">
          <ul>
          <li><img src="/16.jpg"></li>
          <li><h3 align="center">책 제목</h3></li>
          <li><p align="center">조회수<p></li>
          </ul>
      </div> 
      <div class="item col_m_6 col_3">
          <ul>
          <li><img src="/16.jpg"></li>
          <li><h3 align="center">책 제목</h3></li>
          <li><p align="center">조회수<p></li>
          </ul>
      </div>
      <div class="item col_m_6 col_3">
        <ul>
        <li><img src="/16.jpg"></li>
        <li><h3 align="center">책 제목</h3></li>
        <li><p align="center">조회수<p></li>
        </ul>
    </div>    
  </div> <!-- box -->
  <div class="box">
    <div class="item col_m_6 col_3">
        <ul>
        <li><img src="/16.jpg"></li>
        <li><h3 align="center">책 제목</h3></li>
        <li><p align="center">조회수<p></li>
        </ul>
    </div>    
    <div class="item col_m_6 col_3">
        <ul>
        <li><img src="/16.jpg"></li>
        <li><h3 align="center">책 제목</h3></li>
        <li><p align="center">조회수<p></li>
        </ul>
    </div> 
    <div class="item col_m_6 col_3">
        <ul>
        <li><img src="/16.jpg"></li>
        <li><h3 align="center">책 제목</h3></li>
        <li><p align="center">조회수<p></li>
        </ul>
    </div> 
    <div class="item col_m_6 col_3">
        <ul>
        <li><img src="/16.jpg"></li>
        <li><h3 align="center">책 제목</h3></li>
        <li><p align="center">조회수<p></li>
        </ul>
    </div>
    <div class="item col_m_6 col_3">
      <ul>
      <li><img src="/16.jpg"></li>
      <li><h3 align="center">책 제목</h3></li>
      <li><p align="center">조회수<p></li>
      </ul>
  </div>    
</div> <!-- box -->
</section> <!-- items -->
<!-------------------------->





<!--REWARDS-->
<!-- <section class="rewards">
  <div class="bg-left"></div>
  <div class="bg-right"></div>
  <div class="inner">
    <div class="btn-group">
      <div class="btn btn--reverse sign-up">회원가입</div>
      <div class="btn sign-in">로그인</div>
      <div class="btn gift">?</div>
    </div>
  </div>
</section> -->


<!--AWARDS-->
<section class="awards">
  <div class="inner">
    <div class="swiper">
      <div class="swiper-wrapper">
        <div class="swiper-slide">
          <img src="./images/awards_slide1.jpg" alt="대통령 표창" />
        </div>
        <div class="swiper-slide">
          <img src="./images/awards_slide2.jpg" alt="대통령 표창(3년 연속)" />
        </div>
        <div class="swiper-slide">
          <img src="./images/awards_slide3.jpg" alt="우수사업주 인증" />
        </div>
        <div class="swiper-slide">
          <img src="./images/awards_slide4.jpg" alt="경연대회 대상" />
        </div>
        <div class="swiper-slide">
          <img src="./images/awards_slide5.jpg" alt="대한상의회장상" />
        </div>
        <div class="swiper-slide">
          <img src="./images/awards_slide6.jpg" alt="기업사회공헌 활동 부문" />
        </div>
        <div class="swiper-slide">
          <img src="./images/awards_slide7.jpg" alt="KSI 1위(5년 연속)" />
        </div>
        <div class="swiper-slide">
          <img src="./images/awards_slide8.jpg" alt="KS-SQI 1위(5년 연속)" />
        </div>
        <div class="swiper-slide">
          <img src="./images/awards_slide9.jpg" alt="커피전문점 부문(4년 연속)" />
        </div>
        <div class="swiper-slide">
          <img src="./images/awards_slide10.jpg" alt="동반성장 부문(4년 연속)" />
        </div>
      </div>
    </div>
    <div class="swiper-button-prev">
      <span class="material-icons">arrow_back</span>
    </div>
    <div class="swiper-button-next">
      <span class="material-icons">arrow_forward</span>
    </div>
  </div>
</section>

<!--FOOTER-->
<footer>
  <div class="inner">
    <ul class="menu">
      <li><a href="javascript:void(0)" class="orange">개인정보처리방침</a></li>
      <li><a href="javascript:void(0)">영상정보처리기기 운영관리 방침</a></li>
      <li><a href="javascript:void(0)">홈페이지 이용약관</a></li>
      <li><a href="javascript:void(0)">위치정보 이용약관</a></li>
      <li><a href="javascript:void(0)">카드 이용약관</a></li>
      <li><a href="javascript:void(0)">윤리경영 핫라인</a></li>
    </ul>
    <div class="info">
      <span>사업자등록번호 123-45-678901</span>
      <span>(주)헤로피커피 코리아</span>
      <span>TEL : 02) 1234-5678 / FAX : 02) 1234-5678</span>
      <span>개인정보 책임자 : 없음</span>
    </div>
    <p class="copyright">
      &copy; <span class="this-year"></span>
      Heropy Coffee Company. All Rights Reserved.
    </p>
    <img src="images/logo_text.png" alt="HEROPY COFFEE" class="logo" />
  </div>
</footer>

<!--TO TOP BUTTON-->
<div id="to-top">
  <div class="material-icons">arrow_upward</div>
</div>
</body>
</html>

<script>
  /**
 * 검색창 제어
 */
// 검색창 요소(.search) 찾기.
const searchEl = document.querySelector('.search');
const searchInputEl = searchEl.querySelector('input');
// 검색창 요소를 클릭하면 실행.
searchEl.addEventListener('click', function () {
  searchInputEl.focus();
});
// 검색창 요소 내부 실제 input 요소에 포커스되면 실행.
searchInputEl.addEventListener('focus', function () {
  searchEl.classList.add('focused');
  searchInputEl.setAttribute('placeholder', '통합검색');
});
// 검색창 요소 내부 실제 input 요소에서 포커스가 해제(블러)되면 실행.
searchInputEl.addEventListener('blur', function () {
  searchEl.classList.remove('focused');
  searchInputEl.setAttribute('placeholder', '');
});


/**
 * 페이지 스크롤에 따른 요소 제어
 */
// 페이지 스크롤에 영향을 받는 요소들을 검색!
const toTopEl = document.querySelector('#to-top');
// 페이지에 스크롤 이벤트를 추가!
// 스크롤이 지나치게 자주 발생하는 것을 조절(throttle, 일부러 부하를 줌)
window.addEventListener('scroll', function () {
  // 페이지 스크롤 위치가 500px이 넘으면.
  if (window.scrollY > 500) {
    // 상단으로 이동 버튼 보이기!
    gsap.to(toTopEl, .6, {
      opacity: 1,
      x: 0
    });

  // 페이지 스크롤 위치가 500px이 넘지 않으면.
  } else {
    // 상단으로 이동 버튼 숨기기!
    gsap.to(toTopEl, .6, {
      opacity: 0,
      x: 100
    });
  }
});
toTopEl.addEventListener('click', function () {
  gsap.to(window, .6, {
    scrollTo: 0
  });
});


/**
 * 순서대로 나타나는 기능
 */
// 나타날 요소(.fade-in)들을 찾기
const fadeEls = document.querySelectorAll('.visual .fade-in');
// 요소들을 하나씩 반복해서 처리!
fadeEls.forEach(function (fadeEl, index) {
  // 각 요소들을 순서대로(delay) 보여지게 함!
  gsap.to(fadeEl, 1, {
    delay: (index + 1) * .7,
    opacity: 1
  });
});


/**
 * 슬라이드 요소 관리
 */
// new Swiper('.notice .swiper', {
//   direction: 'vertical', // 수직 슬라이드
//   autoplay: true, // 자동 재생 여부
//   loop: true // 반복 재생 여부
// });
new Swiper('.promotion .swiper', {
  // direction: 'horizontal', // 수평 슬라이드
  autoplay: { // 자동 재생 여부
    delay: 5000 // 5초마다 슬라이드 바뀜
  },
  loop: true, // 반복 재생 여부
  slidesPerView: 3, // 한 번에 보여줄 슬라이드 개수
  spaceBetween: 10, // 슬라이드 사이 여백
  centeredSlides: true, // 1번 슬라이드가 가운데 보이기
  pagination: { // 페이지 번호 사용
    el: '.promotion .swiper-pagination', // 페이지 번호 요소
    clickable: true // 사용자의 페이지 번호 제어 여부
  },
  navigation: { // 슬라이드 이전/다음 버튼 사용
    prevEl: '.promotion .swiper-button-prev', // 이전 버튼 요소
    nextEl: '.promotion .swiper-button-next' // 다음 버튼 요소
  }
});
new Swiper('.awards .swiper', {
  autoplay: true, // 자동 재생 여부
  loop: true, // 반복 재생 여부
  spaceBetween: 30, // 슬라이드 사이 여백
  slidesPerView: 5, // 한 번에 보여줄 슬라이드 개수
  navigation: { // 슬라이드 이전/다음 버튼 사용
    prevEl: '.awards .swiper-button-prev', // 이전 버튼 요소
    nextEl: '.awards .swiper-button-next' // 다음 버튼 요소
  }
});


/**
 * Promotion 슬라이드 토글 기능
 */
// 슬라이드 영역 요소 검색!
const promotionEl = document.querySelector('section.promotion');
// 슬라이드 영역를 토글하는 버튼 검색!
const promotionToggleBtn = document.querySelector('.toggle-promotion');

// 토글 버튼을 클릭하면,
promotionToggleBtn.addEventListener('click', function () {
  if (promotionEl.classList.contains('hide')) {
    promotionEl.classList.remove('hide');
  } else {
    promotionEl.classList.add('hide');
  }
});


/**
 * 부유하는 요소 관리
 */
gsap.to('.floating1', 1.5, {
  delay: 1, // 얼마나 늦게 애니메이션을 시작할 것인지 지연 시간을 설정.
  y: 15, // `transform: translateY(수치);`와 같음. 수직으로 얼마나 움직일지 설정.
  repeat: -1, // 몇 번 반복하는지를 설정, `-1`은 무한 반복.
  yoyo: true, // 한번 재생된 애니메이션을 다시 뒤로 재생.
  ease: Power1.easeInOut // Easing 함수 적용.
});
gsap.to('.floating2', 2, {
  delay: .5,
  y: 15,
  repeat: -1,
  yoyo: true,
  ease: Power1.easeInOut
});
gsap.to('.floating3', 2.5, {
  delay: 1.5,
  y: 20,
  repeat: -1,
  yoyo: true,
  ease: Power1.easeInOut
});


/**
 * 요소가 화면에 보여짐 여부에 따른 요소 관리
 */
// 관리할 요소들 검색!
const spyEls = document.querySelectorAll('section.scroll-spy');
// 요소들 반복 처리!
spyEls.forEach(function (spyEl) {
  new ScrollMagic
    .Scene({ // 감시할 장면(Scene)을 추가
      triggerElement: spyEl, // 보여짐 여부를 감시할 요소를 지정
      triggerHook: .8 // 화면의 80% 지점에서 보여짐 여부 감시
    })
    .setClassToggle(spyEl, 'show') // 요소가 화면에 보이면 show 클래스 추가
    .addTo(new ScrollMagic.Controller()); // 컨트롤러에 장면을 할당(필수!)
});




</script>