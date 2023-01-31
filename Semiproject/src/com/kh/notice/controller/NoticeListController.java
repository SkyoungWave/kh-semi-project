package com.kh.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.vo.PageInfo;
import com.kh.notice.model.service.NoticeService;
import com.kh.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeListController
 */
@WebServlet("/list.no")
public class NoticeListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
				// 페이징 처리
				int listCount; // 현재 총 게시글 개수
				int currentPage; // 현재 페이지 (사용자가 요청한 페이지)
				int pageLimit; // 페이지 하단에 보여질 페이징바의 최대 개수 (10개, 20개 등)
				int boardLimit; // 한페이지에 보여질 게시글의 최대 개수 (몇개 단위씩 보여질건지)

				int maxPage; // 가장 마지막 페이지가 몇번 페이지인지 (총 페이지수), 13번째가 마지막이면 14번째 안 보여줘야함
				int startPage; // 페이지 하단에 보여질 페이징바의 시작수
				int endPage; // 페이지 하단에 보여질 페이징바의 끝 수
		
		
		
		//게시글 개수 listCount 구하기
		listCount = new NoticeService().selectListCount();
		
		System.out.println(listCount);
		
		//currentPage: 현재 페이지 (사용자가 요청한 페이지)
		currentPage = Integer.parseInt(request.getParameter("currentPage"));

		//pageLimit: 페이지 하단에 보여질 페이징 바 최대 개수
		pageLimit = 10;

		//boardLimit: 한 페이지에 게시글 몇개씩 보여질건지
		boardLimit = 5;
		
		//maxPage: 페이지끝
		maxPage = (int) (Math.ceil(((double) listCount / boardLimit)));
		
		
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		
		//페이징 처리 구문 VO 생성자에 넣고 생성시에 작업되로록 ( PageInfo에 모듈화)
		PageInfo pi2 = new PageInfo(currentPage);
		
		
		//1. 페이징바를 만들기 위해 필요한 객체
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage,endPage);
		
		
		
		//2. 공지사항 리스트 조회하기(공지 메인화면)
		ArrayList<Notice> list = new NoticeService().selectNoticeList(pi);
		
		//리스트를 boardListView.jsp에 뿌려줘야함
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		
		
		request.getRequestDispatcher("/views/notice/noticeListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
