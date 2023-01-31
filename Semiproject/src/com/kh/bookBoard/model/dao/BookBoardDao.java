package com.kh.bookBoard.model.dao;

import java.io.FileInputStream;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.bookBoard.model.vo.Book;
import com.kh.bookBoard.model.vo.Cover;
import com.kh.bookBoard.model.vo.Genre;
import com.kh.common.JDBCTemplate;
import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;

public class BookBoardDao {

	private Properties prop = new Properties();
	
	public BookBoardDao() {
		String filePath = BookBoardDao.class.getResource("/db/sql/bookBoard-mapper.xml").getPath();
	
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}

	public ArrayList<Book> selectBookList(Connection conn, String search) {
		ArrayList<Book> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBookList");
		
		
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%"+search+"%");
			rset=pstmt.executeQuery();
			while(rset.next()) {
				
				list.add(new Book(rset.getInt("BOOK_NO"),
								  rset.getString("GENRE_NAME"),
								  rset.getString("BOOK_TITLE"),
								  rset.getString("AUTHOR"),
								  rset.getString("BOOK_INFO"),
								  rset.getInt("RENT_COUNT"),
								  rset.getDate("CREATE_BOOK"),
								  rset.getString("STATUS"),
								  rset.getString("FILE_PATH"),
								  rset.getString("ORIGIN_NAME"),
								  rset.getString("CHANGE_NAME"),
								  rset.getInt("RNUM"))
						
						);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		System.out.println("여기는 리스트"+list);

		return list;
	}

	public Book selectBook(Connection conn, int bno) {
		Book b = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBook");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				
				b = new Book(rset.getInt("BOOK_NO"),
								  rset.getString("GENRE_NAME"),
								  rset.getString("BOOK_TITLE"),
								  rset.getString("AUTHOR"),
								  rset.getString("BOOK_INFO"),
								  rset.getInt("RENT_COUNT"),
								  rset.getDate("CREATE_BOOK"),
								  rset.getString("STATUS"),
								  rset.getString("FILE_PATH"),
								  rset.getString("ORIGIN_NAME"),
								  rset.getString("CHANGE_NAME")
						);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return b;
		
	}

	public ArrayList<Genre> selectCategoryList(Connection conn) {
		
		ArrayList<Genre> glist = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCategoryList");
		
		try {
			pstmt=conn.prepareStatement(sql);
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				glist.add(new Genre(
						rset.getInt("GENRE_NO"),
						rset.getString("GENRE_NAME")
						));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return glist;
	}

	public int insertBoard(Connection conn, Book b) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			System.out.println("북타이틀"+b.getBookTitle());
			
			pstmt.setInt(1, Integer.parseInt(b.getGenre()));
			pstmt.setString(2, b.getBookTitle());
			pstmt.setString(3, b.getAuthor());
			pstmt.setString(4, b.getBookInfo());
			pstmt.setDate(5, b.getCreateBook());
			
			result = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public int insertBoard(Connection conn, Cover c) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertCover");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, c.getOriginName());
			pstmt.setString(2, c.getChangeName());
			pstmt.setString(3, c.getFile_path());
			
			result = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public int deleteBook(Connection conn, int bno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteBook");
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			result= pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
		
		
	}

	public Cover selectCover(Connection conn, int bno) {
		Cover c = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectCover");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rset= pstmt.executeQuery();
			
			if(rset.next()) {
				c = new Cover(
							rset.getInt("FILE_NO"),
							rset.getInt("BOOK_NO"),
							rset.getString("ORIGIN_NAME"),							
							rset.getString("CHANGE_NAME"),	
							rset.getString("FILE_PATH"),	
							rset.getDate("ENROLL_DATE"),
							rset.getString("STATUS")
						);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return c;
	}

	public int updateBook(Connection conn, Book b) {
		
		int result = 0; 
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateBook");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b.getBookTitle());
			pstmt.setInt(2, Integer.parseInt(b.getGenre()));
			pstmt.setString(3, b.getAuthor());
			pstmt.setDate(4, b.getCreateBook());
			pstmt.setString(5, b.getBookInfo());
			pstmt.setInt(6, b.getBookNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
		
	}

	public int updateCover(Connection conn, Cover c) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateCover");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c.getOriginName());
			pstmt.setString(2, c.getChangeName());
			pstmt.setString(3, c.getFile_path());
			pstmt.setInt(4, c.getFileNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
		
		
	}

	


}
