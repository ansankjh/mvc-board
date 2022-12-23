<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "model1.service.*" %>
<%@ page import = "model1.vo.*" %>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	// System.out.println(no);
	
	// model1.service 호출
	BoardService boardService = new BoardService();
	ArrayList<Board> list = boardService.getBoardOne(no);

%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>m1BoardOne</title>
	</head>
	<body>
		<h1>상세내용</h1>
		<div>
			<table border="1">
				<thead>
					<tr>
						<th>제목</th>
						<th>내용</th>
					</tr>
				</thead>
				<tbody>
					<%
						for(Board b : list) {
					%>
							<tr>
								<td><%=b.getTitle()%></td>
								<td><%=b.getContent()%></td>
							</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<div>
				<a href="<%=request.getContextPath()%>/model1/m1ModifyBoardForm.jsp?no=<%=no%>">수정</a>
				<a href="<%=request.getContextPath()%>/model1/m1RemoveBoard.jsp?no=<%=no%>">삭제</a>
			</div>
		</div>
	</body>
</html>