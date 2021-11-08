package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.biz.BbsCommentBiz;
import com.biz.UserBiz;

@WebServlet("/deleteUser")
public class deleteUserController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String no=(String)(request.getParameter("userID"));
		UserBiz biz=new UserBiz();
		System.out.println(no);
		int res=biz.deleteUser(no);
		System.out.println(res);
		if(res>0) {
			PrintWriter script = response.getWriter();
			HttpSession session=request.getSession(true);
			session.removeAttribute("userID");//세션 삭제
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
