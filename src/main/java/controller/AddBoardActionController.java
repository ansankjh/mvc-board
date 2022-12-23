package controller;

import java.io.IOException;
import model1.service.*;
import model1.vo.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 컨트롤러 -> 모델 ==============> 클라이언트가 다른 컨트롤러를 요청하도록 리다이렉트
// view(jsp)파일들을 WEB-INF 보안폴더 안으로 이동해서 클라이언트가 View를 직접 호출 못하도록 ...
// list select 					  : C -> M -> V
// form 페이지호출 					  : C -> V
// action insert / update/ delete : C -> M =======> response.sendRedirect()
// do get, do post란?
@WebServlet("/mvc/AddBoardActionController")
public class AddBoardActionController extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Controller
		request.setCharacterEncoding("utf-8");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		System.out.println(title + " <-- AddBoardActionController.doPost.title");
		// System.out.println(content);
		
		// 메서드 호출 매개값
		Board board = new Board();
		board.setTitle(title);
		board.setContent(content);
		
		// 메서드 호출
		BoardService boardService = new BoardService();
		int row = boardService.insertBoard(board);
		
		// BoardList로 돌아가게 강제
		response.sendRedirect(request.getContextPath()+"/mvc/BoardListController");
	}

}
