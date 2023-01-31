package com.kh.bookBoard.controller;

import java.io.IOException;



import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.bookBoard.model.service.BookBoardService;
import com.kh.bookBoard.model.vo.Book;
import com.kh.bookBoard.model.vo.Cover;
import com.kh.common.Controller.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class bookEnrollController
 */
@WebServlet("/enroll.bo")
public class bookEnrollController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public bookEnrollController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10*1024*1024;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/bookBoard_upfiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			String title = multiRequest.getParameter("title");
			String genre = multiRequest.getParameter("genre");
			String author = multiRequest.getParameter("author");
		
			String pubdateR = multiRequest.getParameter("pubdate");
			Date pubdate = Date.valueOf(pubdateR);
			
			String bookContent = multiRequest.getParameter("bookContent");
	//		String cover = multiRequest.getParameter("cover");
			
			
			Book b = new Book();
			
			b.setBookTitle(title);
			b.setGenre(genre);
			b.setAuthor(author);
			b.setCreateBook(pubdate);
			b.setBookInfo(bookContent);
			
			
			Cover c = new Cover();
			c.setOriginName(multiRequest.getOriginalFileName("upfile"));//원본명
			c.setChangeName(multiRequest.getFilesystemName("upfile"));//실제 서버에 업로드되어있는 파일명
			c.setFile_path("resources/bookBoard_upfiles/");

			
			int result = new BookBoardService().insertBoard(b,c);
			
			if(result>0) {
				response.sendRedirect(request.getContextPath()+ "/list.bo?searchText=");
			}
			else {
				System.out.println("실패");
			}
			
		}
		
		

		
		
		
        
		
		
	}

}
