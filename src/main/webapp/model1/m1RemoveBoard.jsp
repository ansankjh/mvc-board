<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "model1.service.*" %>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	// System.out.println(no);
	
	// 서비스 호출
	BoardService boardService = new BoardService();
	int row = boardService.removeBoard(no);
	
	if(row == 1) {
		System.out.println("삭제성공");
		response.sendRedirect(request.getContextPath()+"/model1/m1BoardList.jsp");
	}
%>