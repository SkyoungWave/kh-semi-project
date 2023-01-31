package com.kh.search.model.vo;

import java.sql.Date;

public class Search {
	
	private int userNo;
	private String userId;//	USER_ID	VARCHAR2(30 BYTE)
	private String userPwd;//	USER_PWD	VARCHAR2(100 BYTE)
	private String userName;//	USER_NAME	VARCHAR2(15 BYTE)
	private String userNickName;//	USER_NAME	VARCHAR2(15 BYTE)
	private String phone;//	PHONE	VARCHAR2(13 BYTE)
	private String email;//	EMAIL	VARCHAR2(100 BYTE)
	private String address;//		ADDRESS	VARCHAR2(100 BYTE)
	private int gradeNo;
	private int genreNo;
	private Date enrollDate;//	ENROLL_DATE	DATE
	private Date modifyDate;//	MODIFY_DATE	DATE
	private String status;//	STATUS	VARCHAR2(1 BYTE)
	
	
	public Search() {
		super();
	}


	public Search(int userNo, String userId, String userPwd, String userName, String userNickName, String phone,
			String email, String address, int gradeNo, int genreNo, Date enrollDate, Date modifyDate, String status) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.userNickName = userNickName;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.gradeNo = gradeNo;
		this.genreNo = genreNo;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.status = status;
	}


//	public Search(String userId) {
//		super();
//		this.userId = userId;
//	}
	
	

	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getUserPwd() {
		return userPwd;
	}


	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getUserNickName() {
		return userNickName;
	}


	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public int getGradeNo() {
		return gradeNo;
	}


	public void setGradeNo(int gradeNo) {
		this.gradeNo = gradeNo;
	}


	public int getGenreNo() {
		return genreNo;
	}


	public void setGenreNo(int genreNo) {
		this.genreNo = genreNo;
	}


	public Date getEnrollDate() {
		return enrollDate;
	}


	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}


	public Date getModifyDate() {
		return modifyDate;
	}


	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "Search [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", userNickName=" + userNickName + ", phone=" + phone + ", email=" + email + ", address=" + address
				+ ", gradeNo=" + gradeNo + ", genreNo=" + genreNo + ", enrollDate=" + enrollDate + ", modifyDate="
				+ modifyDate + ", status=" + status + "]";
	}
	
	
	
	
	
	
	

}
