package com.kh.qnaBoard.model.vo;

import java.sql.Date;

public class QnaBoard {
	
	private int qnaBoardNo;			//	BOARD_NO	NUMBER
	private int qnaBoardType;//	BOARD_TYPE	NUMBER
	private String qnaCategory;//	CATEGORY_NO	NUMBER
	private String qnaBoardTitle;//	BOARD_TITLE	VARCHAR2(100 BYTE)
	private String qnaBoardContent;//	BOARD_CONTENT	VARCHAR2(4000 BYTE)
	private String qnaBoardWriter;//	BOARD_WRITER	NUMBER
	private int count;//	COUNT	NUMBER
	private Date createDate;//	CREATE_DATE	DATE
	private String status;//	STATUS	VARCHAR2(1 BYTE)
	
	public QnaBoard() {
		super();
	}
	
	

	
	
	
	public QnaBoard(int qnaBoardNo, String qnaCategory, String qnaBoardTitle, String qnaBoardContent,
			String qnaBoardWriter, Date createDate) {
		super();
		this.qnaBoardNo = qnaBoardNo;
		this.qnaCategory = qnaCategory;
		this.qnaBoardTitle = qnaBoardTitle;
		this.qnaBoardContent = qnaBoardContent;
		this.qnaBoardWriter = qnaBoardWriter;
		this.createDate = createDate;
	}






	public QnaBoard(int qnaBoardNo, String qnaBoardTitle, String qnaBoardWriter, int count, Date createDate) {
		super();
		this.qnaBoardNo = qnaBoardNo;
		this.qnaBoardTitle = qnaBoardTitle;
		this.qnaBoardWriter = qnaBoardWriter;
		this.count = count;
		this.createDate = createDate;
	}
	
	



	public QnaBoard(int qnaBoardNo, String qnaCategory, String qnaBoardTitle, String qnaBoardWriter, int count,
			Date createDate) {
		super();
		this.qnaBoardNo = qnaBoardNo;
		this.qnaCategory = qnaCategory;
		this.qnaBoardTitle = qnaBoardTitle;
		this.qnaBoardWriter = qnaBoardWriter;
		this.count = count;
		this.createDate = createDate;
	}



	public QnaBoard(int qnaBoardNo, int qnaBoardType, String qnaCategory, String qnaBoardTitle, String qnaBoardContent,
			String qnaBoardWriter, int count, Date createDate, String status) {
		super();
		this.qnaBoardNo = qnaBoardNo;
		this.qnaBoardType = qnaBoardType;
		this.qnaCategory = qnaCategory;
		this.qnaBoardTitle = qnaBoardTitle;
		this.qnaBoardContent = qnaBoardContent;
		this.qnaBoardWriter = qnaBoardWriter;
		this.count = count;
		this.createDate = createDate;
		this.status = status;
	}



	public int getQnaBoardNo() {
		return qnaBoardNo;
	}



	public void setQnaBoardNo(int qnaBoardNo) {
		this.qnaBoardNo = qnaBoardNo;
	}



	public int getQnaBoardType() {
		return qnaBoardType;
	}



	public void setQnaBoardType(int qnaBoardType) {
		this.qnaBoardType = qnaBoardType;
	}



	public String getQnaCategory() {
		return qnaCategory;
	}



	public void setCategory(String qnaCategory) {
		this.qnaCategory = qnaCategory;
	}



	public String getQnaBoardTitle() {
		return qnaBoardTitle;
	}



	public void setQnaBoardTitle(String qnaBoardTitle) {
		this.qnaBoardTitle = qnaBoardTitle;
	}



	public String getQnaBoardContent() {
		return qnaBoardContent;
	}



	public void setQnaBoardContent(String qnaBoardContent) {
		this.qnaBoardContent = qnaBoardContent;
	}



	public String getQnaBoardWriter() {
		return qnaBoardWriter;
	}



	public void setQnaBoardWriter(String qnaBoardWriter) {
		this.qnaBoardWriter = qnaBoardWriter;
	}



	public int getCount() {
		return count;
	}



	public void setCount(int count) {
		this.count = count;
	}



	public Date getCreateDate() {
		return createDate;
	}



	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}



	@Override
	public String toString() {
		return "QnaBoard [qnaBoardNo=" + qnaBoardNo + ", qnaBoardType=" + qnaBoardType + ", qnaCategory=" + qnaCategory
				+ ", qnaBoardTitle=" + qnaBoardTitle + ", qnaBoardContent=" + qnaBoardContent + ", qnaBoardWriter="
				+ qnaBoardWriter + ", count=" + count + ", createDate=" + createDate + ", status=" + status + "]";
	}

	
	


	
	

}
