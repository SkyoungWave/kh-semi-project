package com.kh.bookApply.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.bookApply.model.vo.BookApply;
import com.kh.bookApply.model.vo.Pi;
import com.kh.common.JDBCTemplate;

public class BookApplyDao {
	
	private Properties prop=new Properties();
	
	public BookApplyDao() {
		try {
			prop.loadFromXML(new FileInputStream(BookApplyDao.class.getResource("/db/sql/bookApply-mapper.xml").getPath()));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public ArrayList<BookApply> selectBaList(Connection conn,Pi pi) {
		ResultSet rset=null;
		PreparedStatement pstmt= null;
		String sql=prop.getProperty("selectBaList");
		ArrayList<BookApply> list = new ArrayList<>();
		
		int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit()+1;
		int endRow = pi.getCurrentPage() * pi.getBoardLimit();
		
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new BookApply(rset.getInt("BOOK_APPLY_NO") 
									  ,rset.getString("USER_ID")
									  ,rset.getString("BOOK_APPLY_TITLE")
									  ,rset.getString("BOOK_APPLY_CONTENT")
									  ,rset.getDate("CREATE_DATE")
									  ,rset.getInt("COUNT")));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		
		return list;
		
		
	}

	public int selectCount(Connection conn) {
		ResultSet rset=null;
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("selectCount");
		System.out.println("dao"+result);
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				result=rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		
		return result;
		
				
	}

	public int increaseCount(Connection conn, int bno) {
		int result=0;
		PreparedStatement pstmt=null;
		String sql=prop.getProperty("increaseCount");

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
		
		
	}

	public BookApply selectBookApply(Connection conn, int bno) {
		ResultSet rset=null;
		PreparedStatement pstmt=null;
		String sql=prop.getProperty("selectBookApply");
		BookApply ba=null;
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				ba=new BookApply(rset.getInt("BOOK_APPLY_NO")
								,rset.getString("USER_ID")
								,rset.getString("BOOK_APPLY_TITLE")
								,rset.getString("BOOK_APPLY_CONTENT")
								,rset.getDate("CREATE_DATE"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return ba;
	}

	public int selectList(Connection conn) {
		ResultSet rset=null;
		PreparedStatement pstmt=null;
		String sql=prop.getProperty("selectList");
		int result=0;
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				result=rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		
		return result;
	}

	public int insertBa(Connection conn, String title, String content) {
		int result=0;
		PreparedStatement pstmt=null;
		String sql=prop.getProperty("insertBa");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(conn);
		}
		
		return result;
		
	}

}
