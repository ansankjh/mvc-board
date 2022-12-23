<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 
컨트롤러 -> 모델 -> 뷰
컨트롤러 -> 모델 =========> redirect ============> 다른 컨트롤러를 호출
모든 뷰는 컨트롤러를 거쳐가야한다.
뷰만 존재하는 모델은 존재하지 않는다.
 -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>jspAddBoardForm</title>
	</head>
	<body>
		<h1>게시글 입력</h1>
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