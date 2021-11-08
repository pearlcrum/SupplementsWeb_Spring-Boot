package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.biz.BbsCommentBiz;

@WebServlet("/deleteComment")
public class deleteCommentController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no=Integer.parseInt(request.getParameter("no"));
		BbsCommentBiz biz=new BbsCommentBiz();
		int res=biz.deleteComments(no);
		if(res>0) {
			PrintWriter script = response.getWriter();
			response.sendRedirect(request.getHeader("referer"));
		}
	}

}
