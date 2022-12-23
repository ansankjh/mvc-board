package model1.dao;

import java.sql.*;
import model1.vo.*;
import java.util.*;

public class BoardDao {
	// m1BoardList.jsp
	public ArrayList<Board> selectBoardList(Connection conn) throws Exception {
		ArrayList<Board> list = null;
		// 쿼리문 작성
		String sql = "SELECT no, title FROM board";
		// 쿼리 객체 생성
		PreparedStatement stmt = conn.prepareStatement(sql);
		// 쿼리 실행
		ResultSet rs = stmt.executeQuery();
		list = new ArrayList<Board>();
		while(rs.next()) {
			Board b = new Board();
			b.setNo(rs.getInt("no"));
			b.setTitle(rs.getString("title"));
			list.add(b);
		}
		
		stmt.close();
		rs.close();
		return list;
	}
	
	// m1BoardOne.jsp
	public ArrayList<Board> selectBoardOne(Connection conn, int no) throws Exception {
		ArrayList<Board> list = null;
		// 쿼리문 작성
		String sql = "SELECT title, content FROM board WHERE no = ?";
		// 쿼리 객체생성
		PreparedStatement stmt = conn.prepareStatement(sql);
		// 쿼리 ?값 지정
		stmt.setInt(1, no);
		// 쿼리 실행
		ResultSet rs = stmt.executeQuery();
		
		list = new ArrayList<Board>();
		while(rs.next()) {
			Board b = new Board();
			b.setTitle(rs.getString("title"));
			b.setContent(rs.getString("content"));
			list.add(b);
		}
		stmt.close();
		rs.close();
		return list;
	}
	
	// m1BoardAction.jsp
	public int insertBoard(Connection conn, Board board) throws Exception {
		int row = 0;
		// 쿼리문 작성
		String sql = "INSERT INTO board(title, content) values(?, ?)";
		// 쿼리 객체생성
		PreparedStatement stmt = conn.prepareStatement(sql);
		// 쿼리문 ?값 지정
		stmt.setString(1, board.getTitle());
		stmt.setString(2, board.getContent());
		// 쿼리 실행
		row = stmt.executeUpdate();
		
		stmt.close();
		return row;
	}
	
	// m1ModifyBoardForm.jsp
	public ArrayList<Board> selectBoardModify(Connection conn, int no) throws Exception {
		ArrayList<Board> list = null;
		// 쿼리문 작성
		String sql = "SELECT title, content FROM board WHERE no = ?";
		// 쿼리 객체생성
		PreparedStatement stmt = conn.prepareStatement(sql);
		// 쿼리 ?값 지정
		stmt.setInt(1, no);
		// 쿼리 실행
		ResultSet rs = stmt.executeQuery();
		
		list = new ArrayList<Board>();
		while(rs.next()) {
			Board b = new Board();
			b.setTitle(rs.getString("title"));
			b.setContent(rs.getString("content"));
			list.add(b);
		}
		stmt.close();
		rs.close();
		return list;
	}
	
	// m1ModifyBoardForm.jsp
	public int ModifyBoard(Connection conn, Board board) throws Exception {
		int row = 0;
		// 쿼리문 작성
		String sql = "UPDATE board SET title=?, content=? WHERE no=?";
		// 쿼리 객체 생성
		PreparedStatement stmt = conn.prepareStatement(sql);
		// 쿼리문 ?값 지정
		stmt.setString(1, board.getTitle());
		stmt.setString(2, board.getContent());
		stmt.setInt(3, board.getNo());
		// 쿼리 실행
		row = stmt.executeUpdate();
		
		stmt.close();
		return row;
	}
	
	// m1RemoveBoard.jsp
	public int removeBoard(Connection conn, int no) throws Exception {
		// 객체 초기화
		int row = 0;
		// 쿼리문 작성
		String sql = "DELETE FROM board WHERE no = ?";
		// 쿼리 객체 생성
		PreparedStatement stmt = conn.prepareStatement(sql);
		// 쿼리문 ?값 지정
		stmt.setInt(1, no);
		// 쿼리 실행
		row = stmt.executeUpdate();
		
		stmt.close();
		return row;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
