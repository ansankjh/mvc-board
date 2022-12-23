package model1.service;


import java.util.*;
import java.sql.*;

import model1.util.*;
import model1.vo.*;
import model1.dao.*;


//서비스
//1) 예외처리 -> db자원반납, 트랜잭션 처리
//2) Connection객체를 dao에 넘겨주는 역활
//3) 기타 dao안에 있어서는 안되는 비지니스로직(코드)
public class BoardService {
	private BoardDao boardDao;
	
	// m1BoardList.jsp
	public ArrayList<Board> getBoardList() {
		// boardDao 공간확보?
		boardDao = new BoardDao();
		// 객체 초기화
		ArrayList<Board> list = null;
		// 드라이버 초기화
		Connection conn = null;
		
		try {
			// 드라이버 연결
			conn = DBUtil.getConnection();
			// AutoCommit 끄기
			conn.setAutoCommit(false);
			// 메서드 호출
			list = boardDao.selectBoardList(conn);
			// Commit 하기
			conn.commit();
		} catch(Exception e) {
			// 예외발생시 롤백
			try {
				conn.rollback();
			} catch(Exception e1) {
				// 에러 근원지를 찾아 단계별로 에러를 출력해주는 코드
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			// 실행 성공시 자원 반납
			try {
				conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return list;		
	}
	
	// m1BoardOne.jsp
	public ArrayList<Board> getBoardOne(int no) {
		// boardDao 초기화? 공간확보?
		boardDao = new BoardDao();
		// 객체 초기화
		ArrayList<Board> list = null;
		// 드라이버 초기화
		Connection conn = null;
		
		try {
			// 드라이버 연결
			conn = DBUtil.getConnection();
			// AutoCommit끄기
			conn.setAutoCommit(false);
			// 메서드 호출
			list = boardDao.selectBoardOne(conn, no);
			// 커밋하기
			conn.commit();
		} catch(Exception e) {
			// 예외발생시 롤백
			try {
				conn.rollback();
			} catch(Exception e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				// 실행 성공시 자원 반납
				conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	// m1BoardAction.jsp
	public int insertBoard(Board board) {
		boardDao = new BoardDao();
		int row = 0;
		// 드라이버 초기화
		Connection conn = null;
		
		try {
			// 드라이버 연결
			conn = DBUtil.getConnection();
			// 오토커밋 끄기
			conn.setAutoCommit(false);
			// 메서드 호출
			row = boardDao.insertBoard(conn, board);
			// 커밋하기
			conn.commit();
		} catch(Exception e) {
			// 실행실패(예외발생)
			try {
				conn.rollback();
			} catch(Exception e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			// 실행성공(자원반납)
			try {
				conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return row;
	}
	
	// m1ModifyBoardForm.jsp
		public ArrayList<Board> getBoardModify(int no) {
			// boardDao 초기화? 공간확보?
			boardDao = new BoardDao();
			// 객체 초기화
			ArrayList<Board> list = null;
			// 드라이버 초기화
			Connection conn = null;
			
			try {
				// 드라이버 연결
				conn = DBUtil.getConnection();
				// AutoCommit끄기
				conn.setAutoCommit(false);
				// 메서드 호출
				list = boardDao.selectBoardOne(conn, no);
				// 커밋하기
				conn.commit();
			} catch(Exception e) {
				// 예외발생시 롤백
				try {
					conn.rollback();
				} catch(Exception e1) {
					e1.printStackTrace();
				}
				e.printStackTrace();
			} finally {
				try {
					// 실행 성공시 자원 반납
					conn.close();
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
			return list;
		}
	
	// m1ModifyBoardForm.jsp
	public int ModifyBoard(Board board) {
		boardDao = new BoardDao();
		// 객체 초기화
		int row = 0;
		// 드라이버 초기화
		Connection conn = null;
		
		try {
			// 드라이버 연결
			conn = DBUtil.getConnection();
			// 오토커밋 끄기
			conn.setAutoCommit(false);
			// 메서드 호출
			row = boardDao.ModifyBoard(conn, board);
			// 커밋하기
			conn.commit();
		} catch(Exception e) {
			// 실행 실패(롤백)
			try {
				conn.rollback();
			} catch(Exception e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			// 실행성공
			try {
				// 자원반납
				conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return row;
	}
	
	// m1RemoveBoard.jsp
	public int removeBoard(int no) {
		boardDao = new BoardDao();
		// 객체 초기화
		int row = 0;
		// 드라이버 초기화
		Connection conn = null;
		
		try {
			// 드라이버 연결
			conn = DBUtil.getConnection();
			// 커밋끄기
			conn.setAutoCommit(false);
			// 메서드 호출
			row = boardDao.removeBoard(conn, no);
			// 커밋하기
			conn.commit();
		} catch(Exception e) {
			// 실행실패시(롤백)
			try {
				conn.rollback();
			} catch(Exception e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			// 실행성공
			try {
				// 자원반납
				conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return row;
	}
	
	
	
	
	
	
	
	
	
	
	
}
