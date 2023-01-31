package com.kh.qnaBoard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.qnaBoard.model.service.QnaBoardService;
import com.kh.qnaBoard.model.vo.Reply;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class AjaxQnaReplyInsertController
 */
@WebServlet("/rinsert.qbo")
public class AjaxQnaReplyInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxQnaReplyInsertController() {
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
		
		int bno = Integer.parseInt(request.getParameter("qbno"));
		

	
		int reStep = 0;
		int level = 0;
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		
		Reply r = new Reply();
		r.setReplyContent(content);
		r.setRefBno(bno);
		r.setReStep(reStep);
		r.setReLevel(level);
		r.setReplyWriter(String.valueOf(userNo));

		int result = new QnaBoardService().insertReply(r);
		
		response.getWriter().print(result);
		
	}

}
