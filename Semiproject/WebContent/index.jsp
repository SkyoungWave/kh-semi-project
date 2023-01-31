<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.common.JDBCTemplate"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- CRUD  Create / Read (Select) / Update / Delete
		회원서비스 - 로그인(R)/회원가입(C)/회원탈퇴(U/D)/마이페이지(R/수정U)	
		
		공지사항 서비스 - 공지사항 리스트 조회(R) /공지사항 상세조회(R)/공지사항 작성(C)/공지사항수정(U)/공지사항 삭제(D)
		
		일반게시판 서비스 - 게시판리스트 조회(R)-페이징처리/게시판 상세조회(R)/게시판작성(C)-첨부파일1개/
					    게시판 수정(U)/게시판삭제(U/D)/[댓글리스트조회(R)/댓글작성(C)]
		
		사진게시판 서비스 - 게시판리스트 조회(R)-썸네일/게시판 상세조회(R)/게시판작성(C)-다중파일업로드
	-->
	<%JDBCTemplate jd = new JDBCTemplate(); %>
	<%=JDBCTemplate.getConnection() %>
	<%com.kh.common.JDBCTemplate.getConnection(); %>
		<%@ include file="views/common/menubar.jsp" %>
	
<!--VISUAL-->
<section class="visual">

  <div class="inner">
    <div class="fade-in">
      <img src="resources/image/1.jpg" alt="" />
      <img src="resources/image/2.jpg" alt="" class="cup1 image" />
      <img src="resources/image/3.jpg" alt="" class="cup2 image" />
      <img src="resources/image/4.jpg" alt="" class="cup3 image" />
      <img src="resources/image/5.jpg" alt="" class="cup4 image" />
      <img src="resources/image/6.jpg" alt="" class="spoon" />
      <img src="resources/image/8.jpg" alt="" class="cup5 image">
      <img src="resources/image/9.jpg" alt="" class="cup6 image" />
      <img src="resources/image/10.jpg" alt="" class="cup7 image">
      <a href="javascript:void(0)" class="btn btn--white">책 보러가기</a>
      <img src="resources/image/11.jpg" alt="" class="cup8 image" />
    </div>
  </div>
</section>
<!--NOTICE-->
<section class="notice">
  <div class="bg-left"></div>
  <!-- <div class="bg-right"></div> -->
  <div class="inner">
   
    <div class="inner__left">
      <h2 style="padding: 500px;">추천순</h2>
    </div>
  </div>
  
</section>

<!--PROMOTION-->
<section class="promotion">
  <div class="swiper">
      <div class="swiper-wrapper">
      <div class="swiper-slide" align="center">
        <br><br><br>
        <img src="resources/image/도라.jpg" style="width:250px"/>
        <br><p>책 제목: 도라에몽</p>
        <br><p>저자: 도라에몽</p>
        <a href="javascript:void(0)" class="btn">자세히 보기</a>
      </div>
      <div class="swiper-slide" align="center">
        <br><br><br>
        <img src="resources/image/도라.jpg"/>
        <br><p>책 제목: 도라에몽</p>
        <br><p>저자: 도라에몽</p>
        <a href="javascript:void(0)" class="btn">자세히 보기</a>
      </div>
      <div class="swiper-slide" align="center">
        <br><br><br>
        <img src="resources/image/도라.jpg"/>
        <br><p>책 제목: 도라에몽</p>
        <br><p>저자: 도라에몽</p>
        <a href="javascript:void(0)" class="btn">자세히 보기</a>
      </div>
      <div class="swiper-slide" align="center">
        <br><br><br>
        <img src="resources/image/도라.jpg"/>
        <br><p>책 제목: 도라에몽</p>
        <br><p>저자: 도라에몽</p>
        <a href="javascript:void(0)" class="btn">자세히 보기</a>
      </div>
      <div class="swiper-slide" align="center">
        <br><br><br>
        <img src="resources/image/도라.jpg"/>
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
  <div class="inner">
    <div class="inner__left">
      <h2 style="padding: 500px;">도서</h2>
    </div>
  </div>
</section>

<section class="items">
  <br><br>
  <div class="box">
      <div class="item col_m_6 col_3">
          <ul>
          <li><img src="resources/image/도라.jpg"></li>
          <li><h3 align="center">책 제목</h3></li>
          <li><p align="center">조회수<p></li>
          </ul>
      </div>    
      <div class="item col_m_6 col_3">
          <ul>
          <li><img src="resources/image/도라.jpg"></li>
          <li><h3 align="center">책 제목</h3></li>
          <li><p align="center">조회수<p></li>
          </ul>
      </div> 
      <div class="item col_m_6 col_3">
          <ul>
          <li><img src="resources/image/도라.jpg"></li>
          <li><h3 align="center">책 제목</h3></li>
          <li><p align="center">조회수<p></li>
          </ul>
      </div> 
      <div class="item col_m_6 col_3">
          <ul>
          <li><img src="resources/image/도라.jpg"></li>
          <li><h3 align="center">책 제목</h3></li>
          <li><p align="center">조회수<p></li>
          </ul>
      </div>
      <div class="item col_m_6 col_3">
        <ul>
        <li><img src="resources/image/도라.jpg"></li>
        <li><h3 align="center">책 제목</h3></li>
        <li><p align="center">조회수<p></li>
        </ul>
    </div>    
  </div> <!-- box -->
  <div class="box">
    <div class="item col_m_6 col_3">
        <ul>
        <li><img src="resources/image/도라.jpg"></li>
        <li><h3 align="center">책 제목</h3></li>
        <li><p align="center">조회수<p></li>
        </ul>
    </div>    
    <div class="item col_m_6 col_3">
        <ul>
        <li><img src="resources/image/도라.jpg"></li>
        <li><h3 align="center">책 제목</h3></li>
        <li><p align="center">조회수<p></li>
        </ul>
    </div> 
    <div class="item col_m_6 col_3">
        <ul>
        <li><img src="resources/image/도라.jpg"></li>
        <li><h3 align="center">책 제목</h3></li>
        <li><p align="center">조회수<p></li>
        </ul>
    </div> 
    <div class="item col_m_6 col_3">
        <ul>
        <li><img src="resources/image/도라.jpg"></li>
        <li><h3 align="center">책 제목</h3></li>
        <li><p align="center">조회수<p></li>
        </ul>
    </div>
    <div class="item col_m_6 col_3">
      <ul>
      <li><img src="resources/image/도라.jpg"></li>
      <li><h3 align="center">책 제목</h3></li>
      <li><p align="center">조회수<p></li>
      </ul>
  </div>    
</div> <!-- box -->
</section> <!-- items -->
<section class="notice">
  <div class="bg-left"></div>
  <!-- <div class="bg-right"></div> -->
  <div class="inner">
   
    <div class="inner__left">
      <h2 style="padding: 500px;">인기순</h2>
    </div>
  </div>
  
</section>

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
      <span>사업자등록번호 012-34-56789</span>
      <span>(주)KH</span>
      <span>TEL : 02) 1111-1111 / FAX : 02) 1111-1111</span>
      <span>개인정보 책임자 : 없음</span>
    </div>
    <p class="copyright">
      &copy; <span class="this-year"></span>
      JUNGLE BOOK Company. All Rights Reserved.
    </p>
    <img src="images/logo_text.png" alt="정글" class="logo" />
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
	
</body>
</html>