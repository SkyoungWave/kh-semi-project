package com.kh.bookApply.model.vo;

import java.sql.Date;

public class BookApply {
	
		private int bookApplyNo;
		private String bookApplyWriter;
		private String bookApplyTitle;
		private String bookApplyContent;
		private Date createDate;
		private String status;
		private int count;
	
		public BookApply() {
			super();
		}
	
		
		public BookApply(int bookApplyNo, String bookApplyWriter, String bookApplyTitle, String bookApplyContent,
				Date createDate, String status, int count) {
			super();
			this.bookApplyNo = bookApplyNo;
			this.bookApplyWriter = bookApplyWriter;
			this.bookApplyTitle = bookApplyTitle;
			this.bookApplyContent = bookApplyContent;
			this.createDate = createDate;
			this.status = status;
			this.count = count;
		}
		


		
		public BookApply(int bookApplyNo, String bookApplyWriter, String bookApplyTitle, String bookApplyContent,
				Date createDate, int count) {
			super();
			this.bookApplyNo = bookApplyNo;
			this.bookApplyWriter = bookApplyWriter;
			this.bookApplyTitle = bookApplyTitle;
			this.bookApplyContent = bookApplyContent;
			this.createDate = createDate;
			this.count = count;
		}
		
		

		public BookApply(int bookApplyNo, String bookApplyWriter, String bookApplyTitle, String bookApplyContent,
				Date createDate) {
			super();
			this.bookApplyNo = bookApplyNo;
			this.bookApplyWriter = bookApplyWriter;
			this.bookApplyTitle = bookApplyTitle;
			this.bookApplyContent = bookApplyContent;
			this.createDate = createDate;
		}


		public int getBookApplyNo() {
			return bookApplyNo;
		}
		public void setBookApplyNo(int bookApplyNo) {
			this.bookApplyNo = bookApplyNo;
		}
		public String getBookApplyWriter() {
			return bookApplyWriter;
		}
		public void setBookApplyWriter(String bookApplyWriter) {
			this.bookApplyWriter = bookApplyWriter;
		}
		public String getBookApplyTitle() {
			return bookApplyTitle;
		}
		public void setBookApplyTitle(String bookApplyTitle) {
			this.bookApplyTitle = bookApplyTitle;
		}
		public String getBookApplyContent() {
			return bookApplyContent;
		}
		public void setBookApplyContent(String bookApplyContent) {
			this.bookApplyContent = bookApplyContent;
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
		
		public int getCount() {
			return count;
		}
		public void setCount(int count) {
			this.count = count;
		}
		@Override
		public String toString() {
			return "BookApply [bookApplyNo=" + bookApplyNo + ", bookApplyWriter=" + bookApplyWriter
					+ ", bookApplyTitle=" + bookApplyTitle + ", bookApplyContent=" + bookApplyContent + ", createDate="
					+ createDate + ", status=" + status + ", count=" + count + "]";
		}
		
		
		
		
	


}
