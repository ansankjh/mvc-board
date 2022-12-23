<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "model1.service.*" %>
<%@ page import = "model1.vo.*" %>
<%
	// Controller
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	// System.out.println(title);
	// System.out.println(content);
	
	// 메서드 호출 매개값
	Board board = new Board();
	board.setTitle(title);
	board.setContent(content);
	
	// 메서드 호출
	BoardService boardService = new BoardService();
	int row = boardService.insertBoard(board);
	 
	
	if(row == 1) {
		System.out.println("입력성공");
	} else {
		System.out.println("입력실패");
	}
	
	// BoardList로 돌아가게 강제
	response.sendRedirect(request.getContextPath()+"/model1/m1BoardList.jsp");
%>




