package com.kh.qnaBoard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.vo.Member;
import com.kh.qnaBoard.model.service.QnaBoardService;
import com.kh.qnaBoard.model.vo.Reply;

/**
 * Servlet implementation class AjaxQnaReplyReplyInsertController
 */
@WebServlet("/rrInsert.qbo")
public class AjaxQnaReplyReplyInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxQnaReplyReplyInsertController() {
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
		
		int qbno = Integer.parseInt(request.getParameter("qbno"));
		int rbno = Integer.parseInt(request.getParameter("rbno"));

		
		ArrayList<Reply> ilist = new QnaBoardService().insertSelectReplyReply(rbno);
		
	
		int refGroup = ilist.get(0).getRefGroup();
		int reStep = ilist.get(0).getReStep();
		int reLevel = ilist.get(0).getReLevel();
		
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		
		Reply r = new Reply();
		r.setReplyContent(content);
		r.setRefBno(qbno);
		r.setReplyNo(rbno);		
		r.setReStep(reStep);
		r.setReLevel(reLevel);
		r.setRefGroup(refGroup);
		r.setReplyWriter(String.valueOf(userNo));

		int result = new QnaBoardService().insertReplyReply(r);
		
		response.getWriter().print(result);
	}

}
