package com.kh.qnaBoard.controller;

import java.io.IOException;


import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.qnaBoard.model.service.QnaBoardService;
import com.kh.qnaBoard.model.vo.QnaCategory;

/**
 * Servlet implementation class QnaBoardEnrollController
 */
@WebServlet("/enrollForm.qbo")
public class QnaBoardEnrollController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaBoardEnrollController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//글작성 페이지로 포워딩 하기 전에 글작성시 필요한 데이터인 카테고리 데이터들 조회해서 포워딩하기.
				ArrayList<QnaCategory> list = new QnaBoardService().selectQnaCategoryList();
				//카테고리 테이블 정보 list에 담아오기 
				
				request.setAttribute("list", list);
				request.getRequestDispatcher("/views/qnaBoard/qnaBoardEnrollForm.jsp").forward(request, response);
	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
