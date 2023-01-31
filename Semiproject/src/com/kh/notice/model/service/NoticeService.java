package com.kh.notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.PageInfo;
import com.kh.notice.model.dao.NoticeDao;
import com.kh.notice.model.vo.Notice;

public class NoticeService {

	
	//공지사항 리스트 조회하기(공지 메인화면)
	public ArrayList<Notice> selectNoticeList(PageInfo pi) {

		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Notice> list = new NoticeDao().selectNoticeList(conn,pi);
		
		JDBCTemplate.close(conn);

		return list;

	}

	//게시글 개수 listCount 구하기
	public int selectListCount() {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int listCount =	new NoticeDao().selectListCount(conn);
		

		JDBCTemplate.close(conn);

		return listCount;
		
	}

}
