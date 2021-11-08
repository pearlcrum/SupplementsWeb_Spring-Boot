package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.biz.BbsBiz;
import com.vo.BbsVo;



@WebServlet("/find")
public class findController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int no = Integer.parseInt(request.getParameter("bbsID"));
		BbsBiz biz = new BbsBiz();
		BbsVo res = biz.getBBSByID(no);
		request.setAttribute("find", res);
		RequestDispatcher rd = request.getRequestDispatcher("update.jsp");
		rd.forward(request, response);
	}

}
