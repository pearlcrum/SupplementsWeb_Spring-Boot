package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.biz.BbsBiz2;
import com.vo.BbsVo2;



@WebServlet("/find2")
public class findController2 extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int no = Integer.parseInt(request.getParameter("bbsID"));
		BbsBiz2 biz = new BbsBiz2();
		BbsVo2 res = biz.getBBSByID(no);
		request.setAttribute("find2", res);
		
		RequestDispatcher rd = request.getRequestDispatcher("update2.jsp");
		System.out.println(rd);
		rd.forward(request, response);
	}

}
