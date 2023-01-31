package com.kh.bookBoard.model.vo;

public class Genre {
//	GENRE_NO
//	GENRE_NAME
	
	private int genreNo;
	private String genreName;
	
	
	
	
	public Genre() {
		super();
	}


	public Genre(int genreNo, String genreName) {
		super();
		this.genreNo = genreNo;
		this.genreName = genreName;
	}


	public int getGenreNo() {
		return genreNo;
	}


	public void setGenreNo(int genreNo) {
		this.genreNo = genreNo;
	}


	public String getGenreName() {
		return genreName;
	}


	public void setGenreName(String genreName) {
		this.genreName = genreName;
	}


	@Override
	public String toString() {
		return "Genre [genreNo=" + genreNo + ", genreName=" + genreName + "]";
	}
	
	
	
	
	
	
	
	
}