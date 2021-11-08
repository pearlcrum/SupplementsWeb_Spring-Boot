package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.biz.BbsCommentBiz;

/**
 * Servlet implementation class commentController
 */
@WebServlet("/comment")
public class commentController extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userID = null;
		Integer bbsID=0;
		String comment=null;
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		BbsCommentBiz biz=new BbsCommentBiz();
		if(request.getSession().getAttribute("userID") != null){
			userID =(String) request.getSession().getAttribute("userID");
		}
		if(userID==null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 진행해주세요.')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
		if(Integer.parseInt((String)(request.getParameter("bbsID")))!=0
				&&(String)(request.getParameter("comment"))!=null) {
			bbsID=Integer.parseInt((String)(request.getParameter("bbsID")));
			comment=(String)(request.getParameter("comment"));
			biz.insertComments(bbsID, userID, comment);
			System.out.println(request.getHeader("referer"));
			PrintWriter script = response.getWriter();
			response.sendRedirect(request.getHeader("referer"));
		}else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('오류가 발생했습니다')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
	}

}
