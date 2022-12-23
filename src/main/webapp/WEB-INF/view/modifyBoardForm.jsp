<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "model1.service.*" %>
<%@ page import = "model1.vo.*" %>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	// System.out.println(no);
	
	// model1.service 호출
	BoardService boardService = new BoardService();
	ArrayList<Board> list = boardService.getBoardModify(no);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>m1ModifyBoardForm</title>
	</head>
	<body>
		<h1>수정</h1>
		<form action="<%=request.getContextPath()%>/model1/m1ModifyBoardAction.jsp" method="post">
			<input type="hidden" name="no" value="<%=no%>">
			<table border="1">
				<thead>
					<tr>
						<th>title</th>
						<th>content</th>
					</tr>
				</thead>
				<tbody>
					<%
						for(Board b : list) {
					%>
							<tr>
								<td>
									<input type="text" name="title" value="<%=b.getTitle()%>">
								</td>
								<td>
									<textarea cols="50" rows="5" name="content"><%=b.getContent()%></textarea>
								</td>
							</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<div>
				<button type="submit">수정</button>
			</div>
		</form>
	</body>
</html>