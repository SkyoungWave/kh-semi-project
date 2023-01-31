package com.kh.qnaBoard.model.service;

import java.sql.Connection;





import java.util.ArrayList;

import com.kh.qnaBoard.model.vo.Attachment;
import com.kh.qnaBoard.model.vo.QnaBoard;
import com.kh.qnaBoard.model.vo.QnaCategory;
import com.kh.qnaBoard.model.vo.Reply;
import com.kh.qnaBoard.model.dao.QnaBoardDao;
import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.PageInfo;

public class QnaBoardService {
	


	public int selectQnaTextListCount() {
		// TODO Auto-generated method stub
		return 0;
	}



	public int selectQnaTextListCount(String keyWord) {
		Connection conn = JDBCTemplate.getConnection();
		
		int count = new QnaBoardDao().selectQnaTextListCount(conn, keyWord);
		
		JDBCTemplate.close(conn);
		
		return count;
	}
	
	
	

//	public int selectQnaListCount() {
//		Connection conn = JDBCTemplate.getConnection();
//		
//		int count = new BoardDao().selectQnaListCount(conn);
//		
//		JDBCTemplate.close(conn);
//		
//		return count;
//	}

	

	public ArrayList<QnaBoard> selectQnaTextList(PageInfo pi, String keyWord) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<QnaBoard>list = new QnaBoardDao().selectQnaTextList(conn,pi,keyWord);
		
		JDBCTemplate.close(conn);

		return list;
	}
	

//	public ArrayList<QnaBoard> selectQnaList(PageInfo pi) {
//		Connection conn = JDBCTemplate.getConnection();
//		
//		ArrayList<QnaBoard>list = new BoardDao().selectQnaList(conn,pi);
//		
//		JDBCTemplate.close(conn);
//		System.out.println("확인2");
//
//		return list;
//	}


	public int QnaBoardIncreaseCount(int qbno) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new QnaBoardDao().QnaBoardIncreaseCount(conn, qbno);

		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
		
		
	}


	public QnaBoard selectQnaBoard(int qbno) {
		Connection conn = JDBCTemplate.getConnection();
		
		QnaBoard b = new QnaBoardDao().selectQnaBoard(conn,qbno);

		JDBCTemplate.close(conn);
		
		return b;
		
	
	}


	public Attachment selectQnaAttachment(int qbno) {
		Connection conn = JDBCTemplate.getConnection();
		
		Attachment at = new QnaBoardDao().selectQnaAttachment(conn,qbno);

		JDBCTemplate.close(conn);
		
		return at;
	}


	public int insertQnaBoard(QnaBoard b, Attachment at) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new QnaBoardDao().insertQnaBoard(conn,b);
		
		int result2 = 1;
		
		
		if(at !=null) {
			result2 = new QnaBoardDao().insertQnaAttachment(conn,at);
		}
		
		int fr = result*result2;
		
		if(fr>0) {
			JDBCTemplate.commit(conn);	
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		
		return fr;
	}


	public ArrayList<QnaCategory> selectQnaCategoryList() {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<QnaCategory> list = new QnaBoardDao().selectQnaCategoryList(conn);
		
		JDBCTemplate.close(conn);
		
		return list;
		
	}



	public int deleteQnaBoard(int qnaBoardNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new QnaBoardDao().deleteQnaBoard(conn, qnaBoardNo);
		
		JDBCTemplate.close(conn);
		

		return result;
	}



	public int updateQnaBoard(QnaBoard b, Attachment at) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new QnaBoardDao().updateQnaBoard(conn, b);
		
		int result2 = 1;
		
		if(at!=null) {
			
			if(at.getFileNo()!=0) {//기존 첨부파일이 있었던 경우 - update
				result2 = new QnaBoardDao().updateQnaAttachment(conn,at);
			}else {//기존 첨부파일이 없었던 경우 - insert
				//기존 insertAttachment를 쓸수 없는 이유 : 기존에는 참조 게시글 번호를 게시글이 등록됨과
				//동시에 currentValue를 잡아줬기 때문에 이미 뽑혀있는 시퀀스 번호를 찾으려면 
				//전달받아서 진행해야한다. 
				result2 = new QnaBoardDao().insertQnaNewAttachment(conn, at);	
				
			}
		}
		
		int finalResult = result*result2;
		
		if(finalResult>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return finalResult;
		
	
	}



	public int insertReply(Reply r) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new QnaBoardDao().insertReplay(conn,r);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);


		return result;
	}



	public ArrayList<Reply> selectReplyList(int qbno) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Reply> list = new QnaBoardDao().selectReplyList(conn,qbno);
		
		JDBCTemplate.close(conn);
		
		return list;
		
	}



	public int updateReply(Reply r) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new QnaBoardDao().updateReplay(conn,r);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);

		return result;
	}



	public int deleteReply(int qnaReplyNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		
		
		ArrayList<Reply> dlist = new QnaBoardDao().deleteSelectReply(conn, qnaReplyNo);
				
		int refGroup = dlist.get(0).getRefGroup();
		int reStep = dlist.get(0).getReStep();
		int reLevel = dlist.get(0).getReLevel();

		
		int result = new QnaBoardDao().deleteReply(conn, refGroup, reStep, reLevel);
		
		System.out.println(result);
		
		JDBCTemplate.close(conn);
		

		return result;
	}



	public ArrayList<Reply> selectReplyUpdate(int rbno) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Reply> list = new QnaBoardDao().selectReplyUpdate(conn,rbno);
		
		JDBCTemplate.close(conn);
		
		return list;
	}



	public int insertReplyReply(Reply r) {
		Connection conn = JDBCTemplate.getConnection();
		int result2 = new QnaBoardDao().pushLevel(conn,r);
				
		int result = new QnaBoardDao().insertReplyReply(conn,r, result2);
		
		if(result>0) {	
			
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);


		return result;
	}



	public ArrayList<Reply> insertSelectReplyReply(int bno) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		
		
		ArrayList<Reply> ilist = new QnaBoardDao().insertSelectReplyReply(conn, bno);

		
		JDBCTemplate.close(conn);
		

		return ilist;
		
	}





	

		
		


}
