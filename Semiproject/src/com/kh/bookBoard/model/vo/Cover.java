package com.kh.bookBoard.model.vo;

import java.sql.Date;

public class Cover {
	
	private int fileNo;
	private int bookNo;
	private String originName;
	private String changeName;
	private String file_path;
	private Date enrollDate;
	private String status;
	public Cover() {
		super();
	}
	public Cover(int fileNo, int bookNo, String originName, String changeName, String file_path, Date enrollDate,
			String status) {
		super();
		this.fileNo = fileNo;
		this.bookNo = bookNo;
		this.originName = originName;
		this.changeName = changeName;
		this.file_path = file_path;
		this.enrollDate = enrollDate;
		this.status = status;
	}
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	public int getBookNo() {
		return bookNo;
	}
	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}
	public String getOriginName() {
		return originName;
	}
	public void setOriginName(String originName) {
		this.originName = originName;
	}
	public String getChangeName() {
		return changeName;
	}
	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}
	public String getFile_path() {
		return file_path;
	}
	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}
	public Date getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Cover [fileNo=" + fileNo + ", bookNo=" + bookNo + ", originName=" + originName + ", changeName="
				+ changeName + ", file_path=" + file_path + ", enrollDate=" + enrollDate + ", status=" + status + "]";
	}
	
	
	
	
	
	
	
}
