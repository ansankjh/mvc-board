<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>m1AddBoardForm</title>
	</head>
	<body>
		<h1>글입력</h1>
		<form action="<%=request.getContextPath()%>/model1/m1AddBoardAction.jsp" method="post">
			<div>
				<table border="1">
					<thead>
						<tr>
							<th>title</th>
							<th>content</th>
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
					<button type="submit">입력</button>
				</div>
			</div>
		</form>
	</body>
</html>