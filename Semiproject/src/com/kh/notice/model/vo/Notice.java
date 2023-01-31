package com.kh.notice.model.vo;

import java.sql.Date;

public class Notice {

	// BOARD_NO NUMBER
	// BOARD_TYPE NUMBER
	// BOARD_TITLE VARCHAR2(100 BYTE)
	// BOARD_CONTENT VARCHAR2(4000 BYTE)
	// BOARD_WRITER NUMBER
	// COUNT NUMBER
	// CREATE_DATE DATE
	// STATUS VARCHAR2(1 BYTE)
	//

	private int boardNo;
	private int boardType;
	private String boardTitle;
	private String boardContent;
	private String boardWriter;
	private int count;
	private Date createDate;
	private String status;

	public Notice() {
		super();
	}

	
	
	// 공지사항 리스트 조회하기(공지 메인화면)
	
	public Notice(int boardNo, String boardTitle, int count, Date createDate) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.count = count;
		this.createDate = createDate;
	}
	
	
	//생성자 ALL
	public Notice(int boardNo, int boardType, String boardTitle, String boardContent, String boardWriter, int count,
			Date createDate, String status) {
		super();
		this.boardNo = boardNo;
		this.boardType = boardType;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardWriter = boardWriter;
		this.count = count;
		this.createDate = createDate;
		this.status = status;
	}


	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getBoardType() {
		return boardType;
	}

	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getBoardWriter() {
		return boardWriter;
	}

	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
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
		return "Notice [boardNo=" + boardNo + ", boardType=" + boardType + ", boardTitle=" + boardTitle
				+ ", boardContent=" + boardContent + ", boardWriter=" + boardWriter + ", count=" + count
				+ ", createDate=" + createDate + ", status=" + status + "]";
	}

}
