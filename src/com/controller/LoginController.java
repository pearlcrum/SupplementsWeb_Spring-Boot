package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.biz.UserBiz;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public LoginController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		String userID = null;
		String userPassword=null;
		if(request.getSession().getAttribute("userID") != null){
			userID =(String) request.getSession().getAttribute("userID");
		}
		if(userID != null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어있습니다.')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
		if((String)(request.getParameter("userID"))!=null ||
				(String)(request.getParameter("userPassword"))!=null ) {
			userID=(String)(request.getParameter("userID"));
			userPassword=(String)(request.getParameter("userPassword"));
			UserBiz userBiz = new UserBiz();
			int result = userBiz.checkLoginUser(userID, userPassword);
			if(result == 1){
				HttpSession session=request.getSession(true);
				session.setAttribute("userID", request.getParameter("userID"));
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'main.jsp'");
				script.println("</script>");
			}
			else if(result ==0){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('비밀번호가 틀립니다.')");
				script.println("history.back()");
				script.println("</script>");
				
			}
			else if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('존재하지 않는 아이디입니다.')");
				script.println("history.back()");
				script.println("</script>");
				
			}	
			else if(result == -2){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('데이터베이스 오류가 발생했습니다.')");
				script.println("history.back()");
				script.println("</script>");
				
			}
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
