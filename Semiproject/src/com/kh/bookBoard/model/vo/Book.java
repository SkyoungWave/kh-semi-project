package com.kh.bookBoard.model.vo;

import java.sql.Date;

public class Book {
	private int bookNo;
	private String genre;
	private String bookTitle;
	private String author;
	private String bookInfo;
	private int rentCount;
	private Date createBook;
	private String status;
	private String filePath;
	private String originName;
	private String changeName;
	private int rnum;
	
	public Book() {
		super();
	}
	
	
	public int getRnum() {
		return rnum;
	}


	public void setRnum(int rnum) {
		this.rnum = rnum;
	}


	public Book(int bookNo, String genre, String bookTitle, String author, String bookInfo, int rentCount,
			Date createBook, String status, String filePath, String originName, String changeName, int rnum) {
		super();
		this.bookNo = bookNo;
		this.genre = genre;
		this.bookTitle = bookTitle;
		this.author = author;
		this.bookInfo = bookInfo;
		this.rentCount = rentCount;
		this.createBook = createBook;
		this.status = status;
		this.filePath = filePath;
		this.originName = originName;
		this.changeName = changeName;
		this.rnum = rnum;
	}


	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
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


	public Book(int bookNo, String genre, String bookTitle, String author, String bookInfo, int rentCount,
			Date createBook, String status, String filePath, String originName, String changeName) {
		super();
		this.bookNo = bookNo;
		this.genre = genre;
		this.bookTitle = bookTitle;
		this.author = author;
		this.bookInfo = bookInfo;
		this.rentCount = rentCount;
		this.createBook = createBook;
		this.status = status;
		this.filePath = filePath;
		this.originName = originName;
		this.changeName=changeName;
	}



	public Book(int bookNo, String genre, String bookTitle, String author, String bookInfo, int rentCount,
			Date createBook, String status) {
		super();
		this.bookNo = bookNo;
		this.genre = genre;
		this.bookTitle = bookTitle;
		this.author = author;
		this.bookInfo = bookInfo;
		this.rentCount = rentCount;
		this.createBook = createBook;
		this.status = status;
	}
	public int getBookNo() {
		return bookNo;
	}
	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getBookTitle() {
		return bookTitle;
	}
	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getBookInfo() {
		return bookInfo;
	}
	public void setBookInfo(String bookInfo) {
		this.bookInfo = bookInfo;
	}
	public int getRentCount() {
		return rentCount;
	}
	public void setRentCount(int rentCount) {
		this.rentCount = rentCount;
	}
	public Date getCreateBook() {
		return createBook;
	}
	public void setCreateBook(Date createBook) {
		this.createBook = createBook;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Book [bookNo=" + bookNo + ", genre=" + genre + ", bookTitle=" + bookTitle + ", author=" + author
				+ ", bookInfo=" + bookInfo + ", rentCount=" + rentCount + ", createBook=" + createBook + ", status="
				+ status + "]";
	}
	
}
