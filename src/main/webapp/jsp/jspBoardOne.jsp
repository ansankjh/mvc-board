<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	// System.out.println(no);
	
	// 드라이버 로딩
	Class.forName("org.mariadb.jdbc.Driver");
	// 드라이버 연결
	Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/mvc", "root", "wkqk1234");
	// 쿼리문 작성
	String sql = "SELECT content FROM board WHERE no = ?";
	// 쿼리 객체 생성
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
		<title>jspBoardOne</title>
	</head>
	<body>
		<h1>상세보기</h1>
		<table border="1">
			<thead>
				<tr>
					<th>상세내용</th>
				</tr>
			</thead>
			<tbody>
				<%
					while(rs.next()) {
				%>
						<tr>
							<td>
								<textarea cols="50" rows="5" name="content"><%=rs.getString("content")%></textarea>
							</td>
						</tr>
				<%
					}
				%>
			</tbody>
		</table>
		<a href="<%=request.getContextPath()%>/jsp/jspModifyBoardForm.jsp?no=<%=no%>">수정</a>
		<a href="<%=request.getContextPath()%>/jsp/jspRemoveBoard.jsp?no=<%=no%>">삭제</a>
	</body>
</html>