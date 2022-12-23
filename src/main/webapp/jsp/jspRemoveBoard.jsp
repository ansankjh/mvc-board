<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	// System.out.println(no);
	
	// 드라이버 로딩
	Class.forName("org.mariadb.jdbc.Driver");
	// 드라이버 연결
	Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/mvc", "root", "wkqk1234");
	// 쿼리문 작성
	String sql = "DELETE FROM board WHERE no = ?";
	// 쿼리객체 생성
	PreparedStatement stmt = conn.prepareStatement(sql);
	// 쿼리문 ?값 지정
	stmt.setInt(1, no);
	// 쿼리 실행
	int row = stmt.executeUpdate();
	
	if(row == 1) {
		System.out.println("삭제성공");
	} else {
		System.out.println("삭제실패");
	}

	response.sendRedirect(request.getContextPath()+"/jsp/jspBoardList.jsp");
%>