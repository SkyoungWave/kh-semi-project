package com.kh.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.common.JDBCTemplate;
import com.kh.member.model.vo.Member;


public class MemberDao {
	
	//매 메소드마다 Properties 객체를 생성하게 되면 중복코드가 발생한다
	//때문에 MemberDao가 호출될때 생성자를 이용하여 Properties 객체를 생성한다.
	
	private Properties prop = new Properties();
	
	//기본생성자
	public MemberDao() {
		
		String filePath = MemberDao.class.getResource("/db/sql/member-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//로그인 요청을 처리할 메소드(userId와 userPwd를 디비에 저장된 데이터와 비교해보기(select))
	public Member loginMember(Connection conn,String userId,String userPwd) {
		
		//SELECT문으로 회원 한명만 조회하기위해서(로그인) -> 결과값 : ResultSet 으로 꺼내기 
		//ResultSet으로 꺼낸 회원 정보 -> VO(Member)객체에 옮겨담고 가져가기
		//준비물
		Member m = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("loginMember");
		try {
			//전달받은 커넥션객체로 PreparedStatement 객체 생성 
			pstmt = conn.prepareStatement(sql);
			//미완성 상태인 sql 구문에 위치홀더 채워주기
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			//완성시켰으니 전송 및 실행 및 결과값 받아오기(회원조회결과이기 때문에 있거나 없거나)
			rset = pstmt.executeQuery();
			
			if(rset.next()) {//커서가 가르킬 위치가 있는지(조회결과가 있다면)
				m = new Member(rset.getInt("USER_NO")
						      ,rset.getString("USER_ID")
						      ,rset.getString("USER_PWD")
						      ,rset.getString("USER_NAME")
						      ,rset.getString("USER_NICKNAME")
						      ,rset.getString("PHONE")
						      ,rset.getString("EMAIL")
						      ,rset.getString("ADDRESS")
						      ,rset.getInt("GRADE_NO")
						      ,rset.getString("GENRE_NO")
						      ,rset.getDate("ENROLL_DATE")
						      ,rset.getDate("MODIFY_DATE")
						      ,rset.getString("STATUS")
							);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			//자원반납 - 생성의 역순으로 
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return m;
	}
	
	//회원가입
public int insertMember(Connection conn,Member m) {
		
		//준비물
		//넘겨받은 회원의 정보를 데이터베이스에 저장 하는 로직
		//insert문 - 결과값 (처리된 행수 int)
		
//		int result = 0; //결과값인 처리된 행 수를 돌려받을 변수
//		PreparedStatement pstmt = null;
//		String sql = prop.getProperty("insertMember");
//		
//		try {
//			pstmt = conn.prepareStatement(sql);
//			//위치홀더에 데이터 끼워 넣기
//			pstmt.setString(1, m.getUserId());
//			pstmt.setString(2, m.getUserPwd());
//			pstmt.setString(3, m.getUserName());
//			pstmt.setString(4, m.getUserNickname());
//			pstmt.setString(5, m.getPhone());
//			pstmt.setString(6, m.getEmail());
//			pstmt.setString(7, m.getGenre());
//			pstmt.setString(8, m.getAddress());
//
//			
//			//sql구문 실행 및 결과값 받기
//			result = pstmt.executeUpdate();
//		
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}finally {
//			JDBCTemplate.close(pstmt);
//		}
//		
//		return result; //결과값 가지고 돌아가기
		
		int result = 0; //결과값인 처리된 행 수를 돌려받을 변수
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMember");
		System.out.println("확인1");
		
		try {
			pstmt = conn.prepareStatement(sql);
			//위치홀더에 데이터 끼워 넣기
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
			pstmt.setString(3, m.getUserName());
			pstmt.setString(4, m.getUserNickname());
			pstmt.setString(5, m.getPhone());
			pstmt.setString(6, m.getEmail());
			pstmt.setString(7, m.getAddress());
			pstmt.setString(8, m.getGenreNo());
			System.out.println("확인2");
			//sql구문 실행 및 결과값 받기
			result = pstmt.executeUpdate();
			
			System.out.println("확인3");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result; //결과값 가지고 돌아가기
		
	}
	//정보 수정 
	public int updateMember(Connection conn, Member m) {
		//dml구문 update
		int result = 0; //처리된 행의 수 받을 변수
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getUserName());
			pstmt.setString(2, m.getUserNickname());
			pstmt.setString(3, m.getPhone());
			pstmt.setString(4, m.getEmail());
			pstmt.setString(5, m.getAddress());
			pstmt.setString(6, m.getGenreNo());
			pstmt.setString(7, m.getUserId());
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	//아이디로 회원 정보 조회
	public Member selectMember(String userId,Connection conn) {
		//넘겨받은 아이디로 회원의 정보를 조회하여 담아가기
		
		Member m = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectMember");
		ResultSet rset =null;
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("USER_NO")
					      ,rset.getString("USER_ID")
					      ,rset.getString("USER_PWD")
					      ,rset.getString("USER_NAME")
					      ,rset.getString("USER_NICKNAME")
					      ,rset.getString("PHONE")
					      ,rset.getString("EMAIL")
					      ,rset.getString("ADDRESS")
					      ,rset.getInt("GRADE_NO")
					      ,rset.getString("GENRE_NO")
					      ,rset.getDate("ENROLL_DATE")
					      ,rset.getDate("MODIFY_DATE")
					      ,rset.getString("STATUS"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
				
		return m;
	}

	public int deleteMember(Connection conn, String userId, String userPwd) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public String selectMember(Connection conn, String name, String phone) {

		
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("findMember");
		
		String result = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, phone);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getString("USER_ID");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		
		
		return result;
	}

	
	
	
	
	
	
	
	
	
	

}
