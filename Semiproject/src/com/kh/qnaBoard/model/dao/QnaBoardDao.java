package com.kh.qnaBoard.model.dao;

import java.io.FileInputStream;



import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.qnaBoard.model.vo.Attachment;
import com.kh.qnaBoard.model.vo.QnaBoard;
import com.kh.qnaBoard.model.vo.QnaCategory;
import com.kh.qnaBoard.model.vo.Reply;
import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.PageInfo;

public class QnaBoardDao {
	
	private Properties prop = new Properties();
	
	public QnaBoardDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(QnaBoardDao.class.getResource("/db/sql/qnaboard-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}		
	}
	
	//QnA게시판 게시글 총 개수 반환 메소드
	public int selectQnaTextListCount(Connection conn, String keyWord) {
		
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectQnaTextListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, '%'+keyWord+'%');

			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				//조회된 게시글 개수
				listCount = rset.getInt("COUNT");
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		
		return listCount;
	}
	
//	public int selectQnaListCount(Connection conn) {
//			int listCount = 0;
//		
//		PreparedStatement pstmt = null;
//		ResultSet rset = null;
//		
//		String sql = prop.getProperty("selectQnaListCount");
//		
//		try {
//			pstmt = conn.prepareStatement(sql);
//
//			rset = pstmt.executeQuery();
//			
//			if(rset.next()) {
//				//조회된 게시글 개수
//				listCount = rset.getInt("COUNT");
//			
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}finally {
//			JDBCTemplate.close(rset);
//			JDBCTemplate.close(pstmt);
//		}
//		
//		
//		return listCount;
//	}



	/**
	 * @param conn
	 * @param pi
	 * @param searchTitle
	 * @return
	 */
	public ArrayList<QnaBoard> selectQnaTextList(Connection conn, PageInfo pi, String keyWord) {
			
		ResultSet rset = null;
		ArrayList<QnaBoard>list = new ArrayList<>();
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectQnaTextList");
		
		int startRow=(pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
		int endRow=(pi.getCurrentPage())*pi.getBoardLimit();

		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "%"+keyWord+"%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
			list.add(new QnaBoard(rset.getInt("QNABOARD_NO")
					  ,rset.getString("QNACATEGORY_NAME")
					  ,rset.getString("QNABOARD_TITLE")	
					  ,rset.getString("USER_ID")
					  ,rset.getInt("COUNT")
					  ,rset.getDate("CREATE_DATE")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
		
	}
	
//	public ArrayList<QnaBoard> selectQnaList(Connection conn, PageInfo pi) {
//		
//		ResultSet rset = null;
//		ArrayList<QnaBoard>list = new ArrayList<>();
//		PreparedStatement pstmt = null;
//		
//		String sql = prop.getProperty("selectQnaList");
//		
//		int startRow=(pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
//		int endRow=(pi.getCurrentPage())*pi.getBoardLimit();
//		
//		try {
//			pstmt = conn.prepareStatement(sql);
//			
//			pstmt.setInt(1, startRow);
//			pstmt.setInt(2, endRow);
//			
//			rset = pstmt.executeQuery();
//			
//			while(rset.next()) {
//			list.add(new QnaBoard(rset.getInt("QNABOARD_NO")
//					  ,rset.getString("QNACATEGORY_NAME")
//					  ,rset.getString("QNABOARD_TITLE")		
//					  ,rset.getString("USER_ID")
//					  ,rset.getInt("COUNT")
//					  ,rset.getDate("CREATE_DATE")));
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}finally {
//			JDBCTemplate.close(rset);
//			JDBCTemplate.close(pstmt);
//		}
//		
//		return list;
//		
//	}

	public int QnaBoardIncreaseCount(Connection conn, int qbno) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("QnaIncreaseCount");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, qbno);
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(pstmt);
			}
			return result;

	}

	public QnaBoard selectQnaBoard(Connection conn, int qbno) {
		QnaBoard b = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectQnaBoard");


		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qbno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new QnaBoard(rset.getInt("QNABOARD_NO")
						  	    ,rset.getString("QNACATEGORY_NAME")
							    ,rset.getString("QNABOARD_TITLE")
							    ,rset.getString("QNABOARD_CONTENT")
							    ,rset.getString("USER_ID")
							    ,rset.getDate("CREATE_DATE"));
			}

		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return b;
	}

	public Attachment selectQnaAttachment(Connection conn, int qbno) {
		
		Attachment at = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectQnaAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qbno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				at = new Attachment(rset.getInt("QFILE_NO")
								   ,rset.getString("QORIGIN_NAME")
								   ,rset.getString("QCHANGE_NAME")
								   ,rset.getString("QFILE_PATH"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return at;
	}
	
	
	

	public int insertQnaBoard(Connection conn, QnaBoard b) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertQnaBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(b.getQnaCategory()));
			pstmt.setString(2, b.getQnaBoardTitle());
			pstmt.setString(3, b.getQnaBoardContent());
			pstmt.setInt(4, Integer.parseInt(b.getQnaBoardWriter()));
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
		

		
		
	}

	public int insertQnaAttachment(Connection conn, Attachment at) {
		int result = 0;

		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertQnaAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public ArrayList<QnaCategory> selectQnaCategoryList(Connection conn) {
		ArrayList<QnaCategory> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectQnaCategoryList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new QnaCategory(rset.getInt("QNACATEGORY_NO")
						 ,rset.getString("QNACATEGORY_NAME")));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
	
	}

//	public int deleteQnaBoard(Connection conn, int qnaBoardNo) {
//
//		int result = 0;
//		PreparedStatement pstmt = null;
//		String sql = prop.getProperty("deleteQnaBoard");
//		
//		try {
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, qnaBoardNo);
//			result = pstmt.executeUpdate();
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}finally {
//			JDBCTemplate.close(pstmt);
//		}
//		return result;
//	}
	
	public int deleteQnaBoard(Connection conn, int qnaBoardNo) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteQnaBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qnaBoardNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	
	

	public int updateQnaBoard(Connection conn, QnaBoard b) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateQnaBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(b.getQnaCategory()));
			pstmt.setString(2,b.getQnaBoardTitle());
			pstmt.setString(3, b.getQnaBoardContent());
			pstmt.setInt(4, b.getQnaBoardNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public int updateQnaAttachment(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateQnaAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			pstmt.setInt(4, at.getFileNo());
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public int insertQnaNewAttachment(Connection conn, Attachment at) {
		

				int result = 0;
				PreparedStatement pstmt = null;
				String sql = prop.getProperty("insertQnaNewAttachment");
				
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, at.getOriginName());
					pstmt.setString(2, at.getChangeName());
					pstmt.setString(3, at.getFilePath());
					
					result = pstmt.executeUpdate();
				
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					JDBCTemplate.close(pstmt);
				}
				
				return result;
			}

	public int insertReplay(Connection conn, Reply r) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReply");
		
//		
//		if(r.getReplyContent()==null) {
//			r.getReplyContent()="";
//		}
	
		try {
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setString(1, r.getReplyContent());
			pstmt.setInt(2, r.getRefBno());
			pstmt.setInt(3, Integer.parseInt(r.getReplyWriter()));
			
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(conn);
		}
		
		
		return result;
	}

	public ArrayList<Reply> selectReplyList(Connection conn, int qbno) {
		ArrayList<Reply> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReplyList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qbno);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Reply(rset.getInt("QREPLY_NO")
								  ,rset.getString("QREPLY_CONTENT")
								  ,rset.getString("USER_ID")
								  ,rset.getDate("CREATE_DATE")
								  ,rset.getInt("RE_STEP")
								  ,rset.getInt("RE_LEVEL")));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public int updateReplay(Connection conn, Reply r) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateReply");
	
		try {
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setString(1, r.getReplyContent());
			pstmt.setInt(2, r.getReplyNo());
	
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(conn);
		}
		
		
		
		return result;
		
	}

	public ArrayList<Reply> selectReplyUpdate(Connection conn, int rbno) {
		ArrayList<Reply> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReplyUpdate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rbno);
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Reply(rset.getInt("QREPLY_NO")
								  ,rset.getString("QREPLY_CONTENT")
								  ,rset.getString("USER_ID")
								  ,rset.getDate("CREATE_DATE")
								  ,rset.getInt("REF_GROUP")
								  ,rset.getInt("RE_STEP")
								  ,rset.getInt("RE_LEVEL")));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public ArrayList<Reply> deleteSelectReply(Connection conn, int qnaReplyNo) {
		ArrayList<Reply> dlist = new ArrayList<>();

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String sql = prop.getProperty("selectDeleteReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qnaReplyNo);
			rset = pstmt.executeQuery();

			
			while(rset.next()) {
				dlist.add(new Reply(rset.getInt("REF_GROUP")
								  ,rset.getInt("RE_STEP")
								  ,rset.getInt("RE_LEVEL")));
			}	
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return dlist;
	}
	
	
	public int deleteReply(Connection conn, int reGroup, int reStep, int reLevel) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("deleteReply");
			
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, reGroup);
			pstmt.setInt(2, reStep);
			pstmt.setInt(3, reLevel);
			pstmt.setInt(4, reGroup);
			pstmt.setInt(5, reStep);			
			pstmt.setInt(6, reLevel);
			pstmt.setInt(7, reGroup);
	
	
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		PreparedStatement pstmt2 = null;
		
		String sql2 = prop.getProperty("pullLevel");
		
		try {
			pstmt2 = conn.prepareStatement(sql2);
			
			pstmt.setInt(1, result);
			pstmt.setInt(2, reLevel);

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		
		return result;
	}

	public int pushLevel(Connection conn, Reply r) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		if(r.getReLevel()==0) {
			
		}else {
			
		}
		
		String sql = prop.getProperty("pushLevel");

		try {
			pstmt = conn.prepareStatement(sql);
					
			pstmt.setInt(1, r.getReplyNo());
			pstmt.setInt(2, r.getReplyNo());
			pstmt.setInt(3, r.getReplyNo());

			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		System.out.println("밀림?"+result);
		return result;
		
	}
	
	public int insertReplyReply(Connection conn, Reply r, int result2) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		
		
		if(result2 == 0) {
			
			String sql = prop.getProperty("insertReplyReply");

			try {
				pstmt = conn.prepareStatement(sql);
		
				System.out.println(" 지나가나요"+ r.getRefGroup());
				
				pstmt.setString(1, r.getReplyContent());
				pstmt.setInt(2, r.getRefBno());
				pstmt.setString(3, r.getReplyWriter());				
				pstmt.setInt(4, r.getRefGroup());			
				pstmt.setInt(5, r.getRefGroup());
				pstmt.setInt(6, r.getReLevel());


				result = pstmt.executeUpdate();
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
				
				String sql = prop.getProperty("insertReplyReply2");

				try {
					pstmt = conn.prepareStatement(sql);
			
					pstmt.setString(1, r.getReplyContent());
					pstmt.setInt(2, r.getRefBno());
					pstmt.setString(3, r.getReplyWriter());				
					pstmt.setInt(4, r.getRefGroup());			
					pstmt.setInt(5, r.getReStep());
					pstmt.setInt(6, r.getReLevel());
			
					result = pstmt.executeUpdate();
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
				JDBCTemplate.close(conn);
			}
		}
		return result;
	}
	
	
	public ArrayList<Reply> insertSelectReplyReply(Connection conn, int bno) {
		ArrayList<Reply> ilist = new ArrayList<>();

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String sql = prop.getProperty("selectInsertReplyReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rset = pstmt.executeQuery();

			
			while(rset.next()) {
				ilist.add(new Reply(rset.getInt("REF_GROUP")
								  ,rset.getInt("RE_STEP")
								  ,rset.getInt("RE_LEVEL")));
			}	
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return ilist;
	}



}
