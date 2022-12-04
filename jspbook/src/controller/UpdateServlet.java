package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import manager.BoardManager;
import model.UserBean;

@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
private static final long serialVersionUID = 1L;
	
    public UpdateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.setCharacterEncoding("UTF-8");
//		response.setContentType("text/html;charset=utf-8");
//		
//		int board_id = Integer.parseInt(request.getParameter("board_id"));
//		String title = request.getParameter("title");
//		String content = request.getParameter("content");
//		
//		// 로그인 여부(세션)
//		boolean check = BoardManager.getInstance().update(board_id, title, content);
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		HttpSession session = request.getSession();
		UserBean user = (UserBean) session.getAttribute("user");
		String user_id = user.getUserid();
		
		// 로그인 여부(세션)
		boolean check = BoardManager.getInstance().update(id, title, content, user_id);
		PrintWriter out = response.getWriter();	// html처럼 만듬
		if(check) {
			out.println("<script>alert(\"게시글 수정 완료!\");</script>");
			out.println("<script>location.href=\"project/Main.jsp;\"</script>");
		}
		else {
			out.println("<script>alert(\"아이디 혹은 비밀번호를 확인하세요\");</script>");
			out.println("<script>location.href=\"project/Main.jsp\";</script>");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}