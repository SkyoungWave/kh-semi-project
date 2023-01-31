package com.kh.qnaBoard.model.vo;

public class QnaCategory {
	
	private int QnaCategoryNo;//	CATEGORY_NO	NUMBER
	private String QnaCategoryName;//	CATEGORY_NAME	VARCHAR2(30 BYTE)
	
	public QnaCategory() {
		super();
	}

	public QnaCategory(int QnaCategoryNo, String QnaCategoryName) {
		super();
		this.QnaCategoryNo = QnaCategoryNo;
		this.QnaCategoryName = QnaCategoryName;
	}

	public int getQnaCategoryNo() {
		return QnaCategoryNo;
	}

	public void setCategoryNo(int QnaCategoryNo) {
		this.QnaCategoryNo = QnaCategoryNo;
	}

	public String getQnaCategoryName() {
		return QnaCategoryName;
	}

	public void setCategoryName(String QnaCategoryName) {
		this.QnaCategoryName = QnaCategoryName;
	}

	@Override
	public String toString() {
		return "Category [categoryNo=" + QnaCategoryNo + ", categoryName=" + QnaCategoryName + "]";
	}

	
	
	
}
