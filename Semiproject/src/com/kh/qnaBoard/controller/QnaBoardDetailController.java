package com.kh.qnaBoard.controller;

import java.io.IOException;





import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.qnaBoard.model.service.QnaBoardService;
import com.kh.qnaBoard.model.vo.Attachment;
import com.kh.qnaBoard.model.vo.QnaBoard;

/**
 * Servlet implementation class QnaBoardDetailController
 */
@WebServlet("/detail.qbo")
public class QnaBoardDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaBoardDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int qbno = Integer.parseInt(request.getParameter("qbno"));
		
		int result = new QnaBoardService().QnaBoardIncreaseCount(qbno);
		
		if(result>0) {
			QnaBoard b = new QnaBoardService().selectQnaBoard(qbno);
			
			Attachment at = new QnaBoardService().selectQnaAttachment(qbno);
			
			request.setAttribute("b", b);
			request.setAttribute("at", at);
			
			request.getRequestDispatcher("/views/qnaBoard/qnaBoardDetailForm.jsp").forward(request, response);
		}else {
			//실패시 에러페이지 
			request.setAttribute("errorMsg", "게시글 조회 실패");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
			
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
