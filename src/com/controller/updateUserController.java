package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.biz.UserBiz;

/**
 * Servlet implementation class updateUserController
 */
@WebServlet({"/updateUserEmail","/updateUserPassword"})
public class updateUserController extends HttpServlet {
	
	protected void updateEmail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userID=null;
		String userEmail=null;
		String sessionUserID=null;
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		if(request.getSession().getAttribute("userID") != null){
			sessionUserID =(String) request.getSession().getAttribute("userID");
		}
		if ((String)(request.getParameter("no")) != null) {
			userID = (String)(request.getParameter("no")) ;
		}
		if((String)(request.getParameter("email"))!=null) {
			userEmail = (String)(request.getParameter("email")) ;
		}
		
		if (!sessionUserID.equals(userID)) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");				
		}else {
			UserBiz biz=new UserBiz();
			int result=biz.updateEmail(userID, userEmail);
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이메일 수정에 실패했습니다')");
				script.println("history.back()");
				script.println("</script>");
			}else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이메일 수정 성공!')");
				response.sendRedirect(request.getHeader("referer"));
				script.println("</script>");
			}
		}
	}
	protected void updatePassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userID=null;
		String userPassword=null;
		String sessionUserID=null;
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		if(request.getSession().getAttribute("userID") != null){
			sessionUserID =(String) request.getSession().getAttribute("userID");
		}
		if ((String)(request.getParameter("no")) != null) {
			userID = (String)(request.getParameter("no")) ;
		}
		if((String)(request.getParameter("password"))!=null) {
			userPassword = (String)(request.getParameter("password")) ;
		}
		if (!sessionUserID.equals(userID)) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");				
		}else {
			UserBiz biz=new UserBiz();
			int result=biz.updatePassword(userID, userPassword);
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('비밀번호 수정에 실패했습니다')");
				script.println("history.back()");
				script.println("</script>");
			}else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('비밀번호 수정 성공!')");
				response.sendRedirect(request.getHeader("referer"));
				script.println("</script>");
			}
		}
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path=request.getRequestURI();
		if(path.endsWith("updateUserEmail")) {
			updateEmail(request,response);
		}else if(path.endsWith("updateUserPassword")) {
			updatePassword(request,response);
		}else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req,resp);
	}
}
