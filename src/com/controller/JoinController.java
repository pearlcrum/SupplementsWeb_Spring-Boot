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
import com.vo.UserVo;

/**
 * Servlet implementation class JoinController
 */
@WebServlet("/JoinController")
public class JoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public JoinController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userID = null;
		String userPassword=null;
		String userName=null;
		String userGender=null;
		String userEmail=null;
		String userBirth=null;
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		if(request.getSession().getAttribute("userID") != null){
			userID =(String) request.getSession().getAttribute("userID");
		}
		if (userID != null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어있습니다.')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
		if ((String)(request.getParameter("userID"))==null ||
				(String)(request.getParameter("userPassword"))==null ||
						(String)(request.getParameter("userName"))==null||
								(String)(request.getParameter("userGender"))==null||
								(String)(request.getParameter("userEmail"))==null||
								(String)(request.getParameter("userBirth"))==null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		
		else {
			userID=(String)(request.getParameter("userID"));
			userPassword=(String)(request.getParameter("userPassword"));
			userName=(String)(request.getParameter("userName"));
			userGender=(String)(request.getParameter("userGender"));
			userEmail=(String)(request.getParameter("userEmail"));
			userBirth=(String)(request.getParameter("userBirth"));
			UserBiz userBiz = new UserBiz();
			UserVo user=new UserVo(userID,userPassword,userName,userGender,userEmail,userBirth);
			int result = userBiz.joinUser(user);
			if (result == -1) {	
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디입니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				HttpSession session=request.getSession(true);
				session.setAttribute("userID", request.getParameter("userID"));
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'main.jsp'");
				script.println("</script>");
	
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
