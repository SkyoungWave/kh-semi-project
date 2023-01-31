package com.kh.bookApply.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.bookApply.model.dao.BookApplyDao;
import com.kh.bookApply.model.vo.BookApply;
import com.kh.bookApply.model.vo.Pi;
import com.kh.common.JDBCTemplate;

public class BookApplyService {

	public ArrayList<BookApply> selectBaList(Pi pi) {
		Connection conn=JDBCTemplate.getConnection();
		
		ArrayList<BookApply> list =new BookApplyDao().selectBaList(conn,pi);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

	public int selectCount() {
		Connection conn=JDBCTemplate.getConnection();
		int result=new BookApplyDao().selectCount(conn);
		
		JDBCTemplate.close(conn);
		
		
		return result;
	}

	public BookApply increaseCount(int bno) {
		Connection conn=JDBCTemplate.getConnection();
		BookApply ba=new BookApply();
		int result=new BookApplyDao().increaseCount(conn,bno);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
			ba=new BookApplyDao().selectBookApply(conn,bno);
			
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		return ba;
	}

	public int selectList() {
		Connection conn=JDBCTemplate.getConnection();
		
		int result=new BookApplyDao().selectList(conn);
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	public int insertBa(String title, String content) {
		Connection conn=JDBCTemplate.getConnection();
		
		int result=new BookApplyDao().insertBa(conn,title,content);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
	}
	

}
