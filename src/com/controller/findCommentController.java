package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.biz.BbsCommentBiz;
import com.vo.BbsCommentVo;



/**
 * Servlet implementation class findCommentController
 */
@WebServlet("/findComment")
public class findCommentController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int no=Integer.parseInt(request.getParameter("no"));
		BbsCommentBiz biz=new BbsCommentBiz();
		BbsCommentVo res=biz.getCommentsByID(no);
		request.setAttribute("find", res);
		RequestDispatcher rd=request.getRequestDispatcher("updateComment.jsp");
		rd.forward(request,response);
	}

}
