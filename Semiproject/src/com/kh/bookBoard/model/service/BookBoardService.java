package com.kh.bookBoard.model.service;

import java.sql.Connection;


import java.util.ArrayList;

import com.kh.bookBoard.model.dao.BookBoardDao;
import com.kh.bookBoard.model.vo.Book;
import com.kh.bookBoard.model.vo.Cover;
import com.kh.bookBoard.model.vo.Genre;
import com.kh.common.JDBCTemplate;

public class BookBoardService {

	public ArrayList<Book> selectBookList(String search) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Book> list = new BookBoardDao().selectBookList(conn, search);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

	public Book selectBook(int bno) {
		Connection conn = JDBCTemplate.getConnection();
		
		Book b = new BookBoardDao().selectBook(conn, bno);
		
		JDBCTemplate.close(conn);
		return b;
	}

	public ArrayList<Genre> selectCategoryList() {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Genre> glist = new BookBoardDao().selectCategoryList(conn);
		
		return glist;
		
	}

	public int insertBoard(Book b, Cover c) {
		Connection conn = JDBCTemplate.getConnection();
		int result1 = new BookBoardDao().insertBoard(conn, b);
		
		int result2 = 1;
		
		if(c != null) {
			result2=new BookBoardDao().insertBoard(conn, c);
		}
		if((result1 * result2)>0) {
			//첨부파일이 없는경우에 result2를 0으로 초기화 해 둔다면 insert가 성공했을 때도
			//result2는 여전히 0이라서 rollback처리가 될것이기 때문에
			//result2의 초기값을 1로 초기화해둔다.
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		
		return result1* result2;
		
	}

	public int deleteBook(int bno) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new BookBoardDao().deleteBook(conn, bno);
		
		JDBCTemplate.close(conn);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		
		return result;
	}

	public Cover selectCover(int bno) {
		Connection conn = JDBCTemplate.getConnection();
		
		Cover c = new BookBoardDao().selectCover(conn, bno);
		
		JDBCTemplate.close(conn);
		return c;
	}

	public int updateBook(Book b, Cover c) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new BookBoardDao().updateBook(conn, b);
		
		int result2 = new BookBoardDao().updateCover(conn, c);
		
		if(result * result2 > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		
		
		return result *result2;
		
		
		
	}



}
