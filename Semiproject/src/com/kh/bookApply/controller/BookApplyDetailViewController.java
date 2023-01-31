package com.kh.bookApply.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.bookApply.model.service.BookApplyService;
import com.kh.bookApply.model.vo.BookApply;

/**
 * Servlet implementation class BookApplyDetailViewController
 */
@WebServlet("/detail.ba")
public class BookApplyDetailViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookApplyDetailViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bno=Integer.parseInt(request.getParameter("bno"));
		BookApply ba=new BookApply();
		
		
		ba=new BookApplyService().increaseCount(bno);
		
		
		request.setAttribute("ba", ba);
		
		request.getRequestDispatcher("/views/bookApply/bookApplyDetailView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
	
	}

}
