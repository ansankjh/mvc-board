<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "model1.vo.*" %>

<!-- View -->
<%
	// 컨트롤러에서 공유한 모델데이터를 셋팅
	ArrayList<Board> list = (ArrayList<Board>)(request.getAttribute("list"));
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>jspBoardList.jsp</title>
	</head>
	<body>
		<h1>MODEL1 BOARD LIST</h1>
		<div>
			<a href="<%=request.getContextPath()%>/model1/m1AddBoardForm.jsp">글입력</a>
		</div>
		<table border="1">
			<thead>
				<tr>
					<th>no</th>
					<th>title</th>
				</tr>
			</thead>
			<tbody>
				<%
					// ResultSet타입은 내부적 이터레이터(Iterator) 패턴이 적용된 API를 가지고 잇다.
					// 패턴은 무언가 많이 모여있는 것을 하나씩 지정해서 순서대로 처리하는 패턴
					for(Board b : list) { 
				%>
						<tr>
							<td><%=b.getNo()%></td>
							<td>
								<a href='<%=request.getContextPath()%>/model1/m1BoardOne.jsp?no=<%=b.getNo()%>'>
									<%=b.getTitle()%>
								</a>
							</td>
						</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</body>
</html>