package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.biz.BbsBiz2;
import com.vo.BbsVo2;

/**
 * Servlet implementation class SearchController
 */
@WebServlet("/search2")
public class SearchController2 extends HttpServlet {
	//넘어 오는 값 choice, searchText
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String choice=null;
		String searchText=null;
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		if((String)request.getParameter("searchText")==null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('검색어를 제대로 입력해 주십시오.')");
			script.println("history.back()");
			script.println("</script>");
		}else {
			choice=(String)(request.getParameter("choice"));
			searchText=(String)(request.getParameter("searchText"));
			BbsBiz2 biz= new BbsBiz2();
			ArrayList<BbsVo2> res=null;
			if(choice.equals("title")) {
				res= biz.searchByBBSTitle(1, searchText);
			}else if(choice.equals("userId")) {
				res= biz.searchByUserID(1, searchText);
			}else {//내용
				res= biz.searchByBBSContent(1, searchText);
			}
			request.setAttribute("searchAns", res);
			RequestDispatcher rd = request.getRequestDispatcher("bbs2.jsp");
			rd.forward(request, response);
		}
	}

}
