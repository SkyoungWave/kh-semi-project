package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/login.me")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/*
		 * <HttpServletRequest 객체와 HttpServletResponse 객체>
		 * -request : 서버로 요청할때의 정보들이 담겨있다. (요청시 전달값,요청 전송 방식등등)
		 * -response : 요청에 대해 응답할때 필요한 객체들
		 * 
		 * <Get방식과 Post 방식 차이>
		 * -Get 방식 : 사용자가 입력한 값들이 url에 노출되고 데이터 길이 제한이 있다.
		 * -Post 방식 : 					   노출되지 않고 데이터 길이 제한이 없다. 
		 * 
		 * */
		
		//1) 전달값에 한글이 포함되어 있을 경우 인코딩 설정을 해야한다 (post 방식일때)
		request.setCharacterEncoding("UTF-8");
		//2) 사용자가 요청시에 전달한 데이터를 꺼내어 변수 또는 객체화 시키기 (request에 parameter영역에 있는)
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		//아이디 저장 체크박스 데이터
		String saveId = request.getParameter("saveId");
		//쿠키선언 및 null 초기화
		Cookie cookie = null;
				
		//아이디저장이 체크되었는지 확인하여 체크 되었으면 쿠키 생성
		if(saveId != null && saveId.equals("on")) {
			//쿠키의 이름과 값을 넣어서 생성해준다.
			cookie = new Cookie("userId", userId);
			//쿠키의 수명 지정(초단위)
			cookie.setMaxAge(60*60*24); //하루 60초*60*24
					
			//응답객체인 response에 생성된 쿠키 추가ㄴ
			response.addCookie(cookie);
					
		} else {//체크되지 않았으면 쿠키 삭제
			cookie = new Cookie("userId", null); //값을 null로
			cookie.setMaxAge(0); //쿠키의 수명을 0으로 바꾸기
			response.addCookie(cookie);
		}
				
		//3)해당 요청을 처리하는 서비스 클래스의 메소드를 호출
		Member loginUser = new MemberService().loginMember(userId,userPwd);//로그인 회원 정보 또는 null
		
		//4)처리된 결과를 가지고 사용자가 보게될 뷰 지정 후 포워딩 또는 url 재요청
		
		/*
		 * 응답페이지에 전달할 값이 있을 경우 값을 어딘가에 보관해서 전달해야한다.
		 * 그 데이터를 담아놓을 내장객체 4가지 (Servlet scope)
		 * 1) application : application에 담은 데이터는 웹 애플리케이션 전역에서 꺼낼수있다.
		 * 2) session : session에 담은 데이터는 모든 jsp와 servlet에서 꺼낼수있다.
		 * 			  -한번 담아놓은 데이터는 내가 직접 지우기 전까지,서버가 멈추기 전까지, 브라우저가 종료되기 전까지,
		 * 			  -접근하여 사용할 수 있다.
		 * 3) request : request에 담은 데이터는 해당 request를 포워딩(forward)한 응답 jsp에서만 꺼낼수있다.
		 * 4) page : 해당 jsp 페이지에서만 꺼낼수있다.
		 * 
		 * -session과 request를 자주 사용하게 될것 
		 * 
		 * -객체들의 공통 메소드 
		 *  데이터를 꺼내기 위한 메소드 getAttribute("키");
		 *  데이터를 넣기 위한 메소드 setAttribute("키","벨류");
		 *  데이터를 지우기 위한 메소드 removeAttribute("키");
		 * 
		 * */
		//로그인 실패
		if(loginUser==null) { //아이디 비밀번호로 조회된 회원 정보가 없을 경우
			//에러 페이지로 응답
			request.setAttribute("errorMsg", "로그인에 실패했습니다.");
			
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
		}
		//로그인 성공
		else {//아이디 비밀번호로 조회된 회원 결과가 있을 경우
			//index페이지 응답
			//로그인한 회원의 정보를 로그아웃하기 전까지는 유지 시키기 위해서 session객체에 담을것
			
			//Servlet에서 JSP 내장 객체인 session에 접근하고자 한다면 우선 session 객체를 얻어와야한다.
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("alertMsg", "성공적으로 로그인 되었습니다.");
			
			//1.포워딩 방식으로 응답 뷰 출력하기 (forward 방식)
			//포워딩시에 선택한 페이지가 보여질뿐 url매핑정보는 그대로 유지된다.
			//http://localhost:8888/jsp/login.me
//			RequestDispatcher view = request.getRequestDispatcher("index.jsp");
//			view.forward(request, response);
			 
			//2.url 재요청 방식(sendRedirect 방식)
			// http://localhost:8888/jsp/ 로 재요청이 된다.
//			response.sendRedirect("/jsp");
			//각 프로젝트의 context root(path) 가 다를 수 있기때문에
			//또는 변경될 수 있으니
			
			response.sendRedirect(request.getContextPath());
		}
	
	}

}
