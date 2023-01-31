package com.kh.bookBoard.controller;

import java.io.IOException;



import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.bookBoard.model.service.BookBoardService;

/**
 * Servlet implementation class bookDeleteController
 */
@WebServlet("/delete.bo")
public class bookDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public bookDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//asdfasdf
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		int result = new BookBoardService().deleteBook(bno);
//		System.out.println("ㅁㄴㅇㄹ"+result);
		if(result>0) {
			response.sendRedirect(request.getContextPath()+ "/list.bo?searchText=");
		} else {
			System.out.println("삭제 실패");
			
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
