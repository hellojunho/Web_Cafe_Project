package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import manager.UserBeanManager;
import model.UserBean;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public LoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();
		
		String userid = request.getParameter("id");
		String passwd = request.getParameter("password");
		
		// 로그인 여부(세션)
		boolean check = UserBeanManager.getInstance().signIn(userid, passwd);
		PrintWriter out = response.getWriter();	// html처럼 만듬
		if(check) {
			UserBean user = UserBeanManager.getInstance().getUser(userid);
			session.setAttribute("user", user);
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