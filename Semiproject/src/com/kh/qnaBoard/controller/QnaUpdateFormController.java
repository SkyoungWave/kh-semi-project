package com.kh.qnaBoard.controller;

import java.io.IOException;


import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.qnaBoard.model.service.QnaBoardService;
import com.kh.qnaBoard.model.vo.Attachment;
import com.kh.qnaBoard.model.vo.QnaBoard;
import com.kh.qnaBoard.model.vo.QnaCategory;

/**
 * Servlet implementation class QnaUpdateFormController
 */
@WebServlet("/updateForm.qbo")
public class QnaUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		QnaBoardService bService = new QnaBoardService();
		
		int qbno = Integer.parseInt(request.getParameter("qbno"));
		
		//수정페이지로 가기전에 가지고 와야할 데이터 
		//카테고리 목록,해당 게시글정보,첨부파일 정보
		ArrayList<QnaCategory> cList = bService.selectQnaCategoryList();
		
		QnaBoard b = bService.selectQnaBoard(qbno);//게시글번호,카테고리이름,제목,내용,아이디,작성일
		
		Attachment at = bService.selectQnaAttachment(qbno);//null || 파일번호,원본이름,변경이름,경로
		
		request.setAttribute("cList", cList);
		request.setAttribute("b", b);
		request.setAttribute("at", at);
				
		request.getRequestDispatcher("/views/qnaBoard/qnaBoardUpdateForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
