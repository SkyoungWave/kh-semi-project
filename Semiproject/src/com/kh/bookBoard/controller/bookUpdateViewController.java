package com.kh.bookBoard.controller;

import java.io.IOException;

import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.bookBoard.model.service.BookBoardService;
import com.kh.bookBoard.model.vo.Book;
import com.kh.bookBoard.model.vo.Cover;
import com.kh.bookBoard.model.vo.Genre;

/**
 * Servlet implementation class bookUpdateViewController
 */
@WebServlet("/updateView.bo")
public class bookUpdateViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public bookUpdateViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		//book, cover, genre select하기
		
		Book b = new BookBoardService().selectBook(bno);
		
		ArrayList<Genre> g = new BookBoardService().selectCategoryList();
		
		Cover c = new BookBoardService().selectCover(bno);
		
		request.setAttribute("glist", g);
		request.setAttribute("b", b);
		request.setAttribute("c", c);
		
		request.getRequestDispatcher("/views/bookBoard/bookUpdateView.jsp").forward(request, response);
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		
	}

}
