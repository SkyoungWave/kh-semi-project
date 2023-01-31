package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MyPageController
 */
@WebServlet("/mypage.me")
public class MyPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//url직접 요청도 가능하기 때문에
		//로그인 전 요청시에 메인페이지를 띄우면서 alert 메세지로 로그인 후 가능한 서비스입니다.
		
		//로그인시에 세션에 로그인 유저 정보를 담아놨기 때문에 로그인유저 정보가 있는지 없는지 판단하여
		//로그인 유무를 확인한다.
		HttpSession session = request.getSession();
		
		//로그인 전 (회원정보가 세션에 담겨있지 않음)
		if(session.getAttribute("loginUser")==null) {
			
			session.setAttribute("alertMsg", "로그인 후 가능한 서비스입니다.");
			
			response.sendRedirect(request.getContextPath());
			
		}else {//로그인 후 (회원정보가 세션에 담겨있음)
			
			//로그인 후 요청시엔 myPage.jsp로 포워딩 시키기 
			request.getRequestDispatcher("views/member/myPage.jsp").forward(request, response);
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
