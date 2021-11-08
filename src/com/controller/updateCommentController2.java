package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.biz.BbsCommentBiz;
import com.biz.BbsCommentBiz2;
import com.vo.BbsCommentVo2;

/**
 * Servlet implementation class updateCommentController
 */
@WebServlet("/updateComment2")
public class updateCommentController2 extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int commentID=0;
		String userID=null;
		String commentText=null;
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		if(request.getSession().getAttribute("userID") != null){
			userID =(String) request.getSession().getAttribute("userID");
		}
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
		if (Integer.parseInt(request.getParameter("commentID")) != 0) {
			commentID = Integer.parseInt(request.getParameter("commentID"));
		}
		System.out.println(commentID);
		if (commentID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 댓글 입니다.')");
			response.sendRedirect(request.getHeader("referer"));
		}
		BbsCommentVo2 vo=new BbsCommentBiz2().getCommentsByID(commentID);
		
		if (!userID.equals(vo.getUserID())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'bbs2.jsp'");
			script.println("</script>");				
		}else {
			if (request.getParameter("commentContent") == null ) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안된 사항이 있습니다')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				commentText=request.getParameter("commentContent");
				BbsCommentBiz2 biz = new BbsCommentBiz2();
				int result = biz.updateComments(commentID, commentText);
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글수정에 실패했습니다')");
					script.println("history.back()");
					script.println("</script>");
				}else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'bbs2.jsp'");
					script.println("</script>");	
				}

			}
		}
	}

}
