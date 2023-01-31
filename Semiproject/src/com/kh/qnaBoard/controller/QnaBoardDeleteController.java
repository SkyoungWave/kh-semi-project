package com.kh.qnaBoard.controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.qnaBoard.model.service.QnaBoardService;

/**
 * Servlet implementation class QnaBoardDeleteController
 */
@WebServlet("/delete.qbo")
public class QnaBoardDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaBoardDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int QnaBoardNo = Integer.parseInt(request.getParameter("qbno"));
		
		int result = new QnaBoardService().deleteQnaBoard(QnaBoardNo);
		
		if(result>0) {
			request.getSession().setAttribute("alertMsg", "게시글 삭제 성공");
			response.sendRedirect(request.getContextPath()+"/qnaList.bo?currentPage=1");
		}else {
			request.setAttribute("errorMsg", "게시글 삭제 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
