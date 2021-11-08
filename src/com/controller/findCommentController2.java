package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.biz.*;
import com.vo.*;



/**
 * Servlet implementation class findCommentController
 */
@WebServlet("/findComment2")
public class findCommentController2 extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int no=Integer.parseInt(request.getParameter("no"));
		BbsCommentBiz2 biz=new BbsCommentBiz2();
		BbsCommentVo2 res= biz.getCommentsByID(no);
		request.setAttribute("find", res);
		RequestDispatcher rd=request.getRequestDispatcher("updateComment2.jsp");
		rd.forward(request,response);
	}

}
