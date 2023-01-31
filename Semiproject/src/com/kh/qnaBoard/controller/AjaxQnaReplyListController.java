package com.kh.qnaBoard.controller;

import java.io.IOException;



import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.qnaBoard.model.service.QnaBoardService;
import com.kh.qnaBoard.model.vo.Reply;

/**
 * Servlet implementation class AjaxQnaReplyListController
 */
@WebServlet("/rlist.qbo")
public class AjaxQnaReplyListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxQnaReplyListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qbno = Integer.parseInt(request.getParameter("qbno"));
		ArrayList<Reply> list = new QnaBoardService().selectReplyList(qbno);

		
//		request.setAttribute("list", list);
//		System.out.println(list);
//		request.getRequestDispatcher("/views/qnaBoard/replyForm.jsp").forward(request, response);
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(list,response.getWriter());
		
		
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
