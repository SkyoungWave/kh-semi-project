package com.kh.qnaBoard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.vo.Member;
import com.kh.qnaBoard.model.service.QnaBoardService;
import com.kh.qnaBoard.model.vo.Reply;

/**
 * Servlet implementation class AjaxQnaReplyUpdateController
 */
@WebServlet("/rupdate.qbo")
public class AjaxQnaReplyUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxQnaReplyUpdateController() {
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
		request.setCharacterEncoding("UTF-8");

		String content = request.getParameter("content");
		
		int rbno = Integer.parseInt(request.getParameter("rbno"));
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		
		Reply r = new Reply();
		r.setReplyContent(content);
		r.setReplyNo(rbno);
		r.setReplyWriter(String.valueOf(userNo));
		
		
		System.out.println(rbno);
		System.out.println(r);

		int result = new QnaBoardService().updateReply(r);
		System.out.println("result는"+result);
		
		response.getWriter().print(result);
	}

}
