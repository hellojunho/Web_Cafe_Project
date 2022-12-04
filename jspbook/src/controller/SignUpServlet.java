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

@WebServlet("/SignUpServlet")
public class SignUpServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    public SignUpServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();
		
		String userid = request.getParameter("id");
		String passwd = request.getParameter("password");
		String username = request.getParameter("name");
		
		boolean check = UserBeanManager.getInstance().signUp(userid, passwd, username);
		PrintWriter out = response.getWriter();	// html처럼 만듬
		if(check) {
			UserBean user = new UserBean();
			user.setUserid(userid);
			user.setPasswd(passwd);
			user.setUsername(username);
			session.setAttribute("user", user);
			
			out.println("<script>alert(\"회원가입 완료!\");</script>");
			out.println("<script>location.href=\"project/Main.jsp;\"</script>");
		}
		else {
			out.println("<script>alert(\"이미 존재하는 아이디입니다.\");</script>");
			out.println("<script>location.href=\"project/Main.jsp\";</script>");
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}