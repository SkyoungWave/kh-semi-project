package com.kh.search.controller;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;
import com.kh.search.model.service.SearchService;
/**
 * Servlet implementation class SearchController
 */
@WebServlet("/searchIdClick.me")
public class SearchIdClickController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchIdClickController() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		}		
		
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String userName = request.getParameter("userName");
		String phone = request.getParameter("phone");
		
		System.out.println(userName);
		System.out.println(phone);
		
		Member m = new SearchService().searchMember(userName,phone);
		
	
		if (m == null) {
			request.setAttribute("errorMsg", "일치하는 회원이 존재하지 않습니다.");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
	
		}else {		
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", userName + " 님의 아이디는 [ " + m.getUserId() + " ] 입니다.");

			//메인페이지 재요청
			response.sendRedirect(request.getContextPath());
		
		}
	}
}
