<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
	// Controller
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	// System.out.println(title);
	
	// 드라이버 로딩
	Class.forName("org.mariadb.jdbc.Driver");
	// 드라이버 연결
	Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/mvc", "root", "wkqk1234");
	// 쿼리문 작성
	String sql = "INSERT INTO board(title, content) values(?, ?)";
	// 쿼리 객체 생성
	PreparedStatement stmt = conn.prepareStatement(sql);
	// 쿼리문 ?값 지정
	stmt.setString(1, title);
	stmt.setString(2, content);
	// 쿼리 실행
	int row = stmt.executeUpdate();
	
	if(row == 1) {
		System.out.println("추가성공");
	} else {
		System.out.println("추가실패");
	}
	
	response.sendRedirect(request.getContextPath()+"/jsp/jspBoardList.jsp");
%>