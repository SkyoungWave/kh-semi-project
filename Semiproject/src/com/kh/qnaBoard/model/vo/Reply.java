package com.kh.qnaBoard.model.vo;

import java.sql.Date;

public class Reply {
	private int replyNo;		//	리뷰번호 - 리뷰 번호
	private String replyContent;			//	REPLY_CONTENT	VARCHAR2(400 BYTE)
	private int refBno;//	참조 게시글 번호 - 상희 누나가 만든 책 게시글 번호  
	private String replyWriter;//	작성자 회원번호 -> member no 랑 조인해서 아이디 받아와야됨. 
	//포린기 memberno 받아오면 
	private Date createDate;//	CREATE_DATE	DATE
	private String status;//	STATUS	VARCHAR2(1 BYTE)
	private int refGroup;
	private int reStep;
	private int reLevel;
	
	public Reply() {
		super();
	}
	
	
	
	public Reply(int refGroup, int reStep, int reLevel) {
		super();
		this.refGroup = refGroup;
		this.reStep = reStep;
		this.reLevel = reLevel;
	}



	public Reply(int replyNo, String replyContent, String replyWriter, Date createDate) {
		super();
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.replyWriter = replyWriter;
		this.createDate = createDate;
	}
	
	
	

	public Reply(int replyNo, String replyContent, String replyWriter, Date createDate, int reStep,
			int reLevel) {
		super();
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.replyWriter = replyWriter;
		this.createDate = createDate;
		this.reStep = reStep;
		this.reLevel = reLevel;
	}

	public Reply(int replyNo, String replyContent, String replyWriter, Date createDate, int refGroup, int reStep,
			int reLevel) {
		super();
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.replyWriter = replyWriter;
		this.createDate = createDate;
		this.refGroup = refGroup;
		this.reStep = reStep;
		this.reLevel = reLevel;
	}

	public Reply(int replyNo, int reLevel, String replyContent, String replyWriter, Date createDate) {
		super();
		this.replyNo = replyNo;
		this.reLevel = reLevel;
		this.replyContent = replyContent;
		this.replyWriter = replyWriter;
		this.createDate = createDate;
	}

	public Reply(int replyNo, String replyContent, int refBno, String replyWriter, Date createDate, String status) {
		super();
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.refBno = refBno;
		this.replyWriter = replyWriter;
		this.createDate = createDate;
		this.status = status;
	}

	public Reply(int replyNo, String replyContent, int refBno, String replyWriter, Date createDate, String status,
			int refGroup, int reStep, int reLevel) {
		super();
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.refBno = refBno;
		this.replyWriter = replyWriter;
		this.createDate = createDate;
		this.status = status;
		this.refGroup = refGroup;
		this.reStep = reStep;
		this.reLevel = reLevel;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public int getRefBno() {
		return refBno;
	}

	public void setRefBno(int refBno) {
		this.refBno = refBno;
	}

	public String getReplyWriter() {
		return replyWriter;
	}

	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
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

	public int getRefGroup() {
		return refGroup;
	}

	public void setRefGroup(int refGroup) {
		this.refGroup = refGroup;
	}

	public int getReStep() {
		return reStep;
	}

	public void setReStep(int reStep) {
		this.reStep = reStep;
	}

	public int getReLevel() {
		return reLevel;
	}

	public void setReLevel(int reLevel) {
		this.reLevel = reLevel;
	}

	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", replyContent=" + replyContent + ", refBno=" + refBno + ", replyWriter="
				+ replyWriter + ", createDate=" + createDate + ", status=" + status + ", refGroup=" + refGroup
				+ ", reStep=" + reStep + ", reLevel=" + reLevel + "]";
	}
	
	

	
	
	
	
	
}
