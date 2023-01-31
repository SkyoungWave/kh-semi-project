package com.kh.bookApply.model.vo;

import com.kh.bookApply.model.service.BookApplyService;

public class Pi {
	private int listCount;
	private int startPage;
	private int endPage;
	private int currentPage;
	private int boardLimit;
	private int pageLimit;
	private int maxPage;
	public Pi() {
		super();
	}
	public Pi(int listCount, int startPage, int endPage, int currentPage, int boardLimit, int pageLimit, int maxPage) {
		super();
		this.listCount = listCount;
		this.startPage = startPage;
		this.endPage = endPage;
		this.currentPage = currentPage;
		this.boardLimit = boardLimit;
		this.pageLimit = pageLimit;
		this.maxPage = maxPage;
	}
	public int getListCount() {
		return listCount;
	}
	public void setListCount(int listCount) {
		this.listCount = listCount;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getBoardLimit() {
		return boardLimit;
	}
	public void setBoardLimit(int boardLimit) {
		this.boardLimit = boardLimit;
	}
	public int getPageLimit() {
		return pageLimit;
	}
	public void setPageLimit(int pageLimit) {
		this.pageLimit = pageLimit;
	}
	public int getMaxPage() {
		return maxPage;
	}
	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}
	@Override
	public String toString() {
		return "Pi [listCount=" + listCount + ", startPage=" + startPage + ", endPage=" + endPage + ", currentPage="
				+ currentPage + ", boardLimit=" + boardLimit + ", pageLimit=" + pageLimit + ", maxPage=" + maxPage
				+ "]";
	}
	
	
	
}
