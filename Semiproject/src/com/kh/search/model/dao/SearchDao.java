package com.kh.search.model.dao;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import com.kh.common.JDBCTemplate;
import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;
public class SearchDao {
	
	private Properties prop = new Properties();
	
	//기본생성자
		public SearchDao() {
			
			String filePath = SearchDao.class.getResource("/db/sql/search-mapper.xml").getPath();
			
			try {
				prop.loadFromXML(new FileInputStream(filePath));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		
		
	public Member searchId(Connection conn, String userName, String phone) {
		Member m = null ;
		ResultSet rset =null;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("searchId");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userName );
			pstmt.setString(2, phone );
			
			rset = pstmt.executeQuery();

			if(rset.next()) {//커서가 가르킬 위치가 있는지(조회결과가 있다면)
				m = new Member(rset.getString("USER_ID"));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return m;
	}


	

	public Member searchPwd(Connection conn, String userId, String email) {
		Member m = null ;
		ResultSet rset =null;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("searchPwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId );
			pstmt.setString(2, email );
			
			rset = pstmt.executeQuery();

			if(rset.next()) {//커서가 가르킬 위치가 있는지(조회결과가 있다면)
				m = new Member(rset.getString("USER_PWD"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return m;
	}
}