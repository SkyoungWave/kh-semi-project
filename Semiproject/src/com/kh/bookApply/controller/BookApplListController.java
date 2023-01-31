package com.kh.bookApply.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.bookApply.model.service.BookApplyService;
import com.kh.bookApply.model.vo.BookApply;
import com.kh.bookApply.model.vo.Pi;

/**
 * Servlet implementation class BookApplyMainController
 */
@WebServlet("/list.ba")
public class BookApplListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookApplListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int listCount = new BookApplyService().selectList();
		
		int startPage;
		int endPage;
		int maxPage;
		int boardLimit;
		int pageLimit;
		int currentPage;
		
		currentPage=Integer.parseInt(request.getParameter("currentPage"));
		boardLimit=10;
		pageLimit=10;
		
		
		startPage=(currentPage/pageLimit)*pageLimit+1;
		endPage=startPage+(pageLimit-1);
		maxPage=(int) Math.ceil((listCount/boardLimit));
		
		if(maxPage<endPage) {
			endPage=maxPage;
		}
		Pi pi=new Pi(listCount,startPage,endPage,currentPage,boardLimit,pageLimit,maxPage);
		
		
		ArrayList<BookApply> list=new BookApplyService().selectBaList(pi);
		
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		
		
		
		request.getRequestDispatcher("/views/bookApply/bookApplyListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
