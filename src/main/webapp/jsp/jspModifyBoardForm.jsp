<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
	// Controller	
	int no = Integer.parseInt(request.getParameter("no"));
	// System.out.println(no);
	
	// 드라이버 로딩
	Class.forName("org.mariadb.jdbc.Driver");
	// 드라이버 연결
	Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/mvc", "root", "wkqk1234");
	// 쿼리문 작성
	String sql = "SELECT title, content FROM board WHERE no = ?";
	// 쿼리 객체생성
	PreparedStatement stmt = conn.prepareStatement(sql);
	// 쿼리문 ?값 지정
	stmt.setInt(1, no);
	// 쿼리 실행
	ResultSet rs = stmt.executeQuery();
	
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>jspModifyBoardForm</title>
	</head>
	<body>
		<h1>내용수정</h1>
		<div>
			<form action="<%=request.getContextPath()%>/jsp/jspModifyBoardAction.jsp" method="post">
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
							while(rs.next()) {
						%>
								<tr>
									<td>
										<input type="text" name="title" value="<%=rs.getString("title")%>">
									</td>
									<td>
										<textarea cols="50" rows="5" name="content"><%=rs.getString("content")%></textarea>
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
		</div>
	</body>
</html>