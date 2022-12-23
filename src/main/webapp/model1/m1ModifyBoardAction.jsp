<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "model1.vo.*" %>
<%@ page import = "model1.service.*" %>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	// System.out.println(no);
	// System.out.println(title);
	// System.out.println(content);
	
	// 메서드 호출 매개값
	Board board = new Board();
	board.setNo(no);
	board.setTitle(title);
	board.setContent(content);
	
	
	// 메서드 호출
	BoardService boardService = new BoardService();
	int row = boardService.ModifyBoard(board);
	
	if(row == 1) {
		System.out.println("수정성공");
		response.sendRedirect(request.getContextPath()+"/model1/m1BoardList.jsp");
	} else {
		System.out.println("수정실패");
	}
%>



