package com.kh.search.model.service;

import java.sql.Connection;

import com.kh.common.JDBCTemplate;
import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;
import com.kh.search.model.dao.SearchDao;

public class SearchService {

	public Member searchMember(String userName, String phone) {
		
		Connection conn = JDBCTemplate.getConnection();
		Member m =  new SearchDao().searchId(conn,userName,phone);
	
		JDBCTemplate.close(conn);
		
		return m;
		
	}
	

	public Member searchPwd(String userId, String email) {
		Connection conn = JDBCTemplate.getConnection();
		Member m =  new SearchDao().searchPwd(conn,userId,email);
	
		JDBCTemplate.close(conn);
		
		return m;
	}
	

}
