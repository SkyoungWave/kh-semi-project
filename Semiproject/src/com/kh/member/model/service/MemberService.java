package com.kh.member.model.service;

import java.sql.Connection;

import com.kh.common.JDBCTemplate;
import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;


public class MemberService {
	//db에 연결할 connection 객체와 transaction 처리 하기 위한 파트 
	
	//로그인
	public Member loginMember(String userId,String userPwd) {
		Connection conn = JDBCTemplate.getConnection();
		
		//db접속 정보를 담은 connection을 생성했으니 해당 객체와 사용자에게 넘겨받은 데이터를 가지고
		//db에 sql문 실행시키기 위해서 DAO를 호출하기  
		Member m = new MemberDao().loginMember(conn,userId,userPwd);
		
		//자원반납 (select문으로 조회를 했으니 트랜잭션처리는 할 필요 없음)
		JDBCTemplate.close(conn);
		
		return m;
	}
	
	//회원가입
	public int insertMember(Member m) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MemberDao().insertMember(conn,m);
		
		//트랜잭션 처리 (DML구문)
		if(result>0) { //성공시 커밋 
			JDBCTemplate.commit(conn);
		}else {//실패시 롤백
			JDBCTemplate.rollback(conn);
		}
		
		//커넥션 자원 반납
		JDBCTemplate.close(conn);
		
		//결과값 들고 돌아가기
		return result;
	}
	
	//정보수정 
	public Member updateMember(Member m) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MemberDao().updateMember(conn,m);
	
		Member updateUser = null;
		
		if(result>0) {
			JDBCTemplate.commit(conn);
			//update는 성공했으니 변경된 회원의 정보를 조회하기위해 다시 dao한테 요청 
			//회원의 아이디로 회원 정보 조회 
			updateUser = new MemberDao().selectMember(m.getUserId(),conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return updateUser;
	}

	public int deleteMember(String userId, String userPwd) {
		// TODO Auto-generated method stub

		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MemberDao().deleteMember(conn,userId,userPwd);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}
	
	public String selectMember(String name, String phone) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		String result = new MemberDao().selectMember(conn, name, phone);
		
		JDBCTemplate.close(conn);
		
		return result;
		
	}

	
	
	
	
	
	
	
	
	
}
