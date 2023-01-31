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

/**
 * Servlet implementation class bookListController
 */
@WebServlet("/list.bo")
public class bookListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public bookListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = request.getParameter("searchText");

		
		ArrayList<Book> book = new BookBoardService().selectBookList(search);
		
		
		if(book != null) {
			request.setAttribute("book", book);
			request.getRequestDispatcher("/views/bookBoard/bookListView.jsp").forward(request, response);
			
		}else {
			System.out.println("조회 실패");
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
