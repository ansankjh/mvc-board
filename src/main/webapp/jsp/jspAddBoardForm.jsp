<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>jspAddBoardForm</title>
	</head>
	<body>
		<form action="<%=request.getContextPath()%>/jsp/jspAddBoardAction.jsp" method="post">
			<table border="1">
				<thead>	
					<tr>
						<th>제목</th>
						<th>내용</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<input type="text" name="title">
						</td>
						<td>
							<textarea cols="50" rows="5" name="content"></textarea>
						</td>
					</tr>
				</tbody>
				
			</table>
			<div>
				<button type="submit">글입력</button>
			</div>
		</form>
	</body>
</html>