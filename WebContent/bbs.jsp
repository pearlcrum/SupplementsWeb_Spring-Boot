<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.io.PrintWriter" %>
<%@ page import ="com.biz.BbsBiz" %>
<%@ page import ="com.vo.BbsVo" %>
<%@ page import ="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device" ,initial-scale="1">
<link href="image/favicon.png" rel="shortcut icon">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>SupplementsWeb</title>
<style type="text/css">
a, a:hover {
	color: #000000;
	text-decoration: none;
}
</style>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
			
		}
		int pageNumber = 1;
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp"><img alt="logo"
				src="image/logo.png" style="margin-top: -30px; height: 80px"></a>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>

				<li><a href="infoENS.jsp">영양제 소개</a>
					<ul class="sub-menu1">
						<li><a href="infoENS.jsp">현대인 필수 영양제</a></li>
						<li><a href="infoCNS.jsp">증상별 영양제 추천</a></li>
						<li><a href="infoNGNS.jsp">같이 섭취하면 좋지 않은 영양제</a></li>
					</ul></li>


				<li ><a href="bbs2.jsp">Q&A 게시판</a></li>

				<li class="active"><a href="bbs.jsp">후기 게시판</a></li>

				<li><a href="newsVideo.jsp">NEWS & VIDEO</a></li>

				<li><a href="myPage.jsp">마이페이지</a>
					<ul class="sub-menu2">
						<li><a href="#">회원 정보 수정</a></li>
					</ul></li>
			</ul>
			<%
  	if(userID == null){
  		  	
  %>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropddown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li class="active"><a href="login.jsp">로그인</a></li>
						<!-- active : 선택이 됨을 알려줌 -->
						<li><a href="join.jsp">회원가입</a></li>
					</ul></li>
			</ul>
			<%
  	} else {
  %>

			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropddown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>

					</ul></li>
			</ul>
			<%
 
 }
  
  %>
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<table class="table table-striped">
				<thead>
					<tr>
						<!-- <th class="table-style-3" style="width: 10%;">번호</th> -->
						<th class="table-style-3" style="width: 40%;">제목</th>
						<th class="table-style-3" style="width: 20%;">작성자</th>
						<th class="table-style-3" style="width: 20%;">작성일</th>
						<th class="table-style-3" style="width: 10%;">조회수</th>
					</tr>
				</thead>
				<tbody>
					<%
					if(request.getAttribute("searchAns") == null){
						
					BbsBiz bbsBiz = new BbsBiz();
					ArrayList<BbsVo> list = bbsBiz.getBBSByPage(pageNumber);
					for(int i = 0; i <list.size(); i++){
				
				%>


					<tr>
						<!-- <td><%= list.get(i).getBbsID() %></td> -->
						<td class="table-style-6"><a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle() %></a></td>
						<td class="table-style-4"><%= list.get(i).getUserID() %></td>
						<td class="table-style-4"><%= list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시" + list.get(i).getBbsDate().substring(14, 16) + "분"%></td>
						<td class="table-style-4"><%= list.get(i).getBbsView()%></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
			<%
				if(pageNumber != 1){
				
				%>
			<a href="bbs.jsp?pageNumber=<%=pageNumber - 1 %>"
				class="btn btn-success btn-arraw-left">이전</a>
			<%
				} if(bbsBiz.isEmptyNextPageBBS(pageNumber)){
				%>
			<a href="bbs.jsp?pageNumber=<%=pageNumber + 1 %>"
				class="btn btn-success btn-arraw-left">다음</a>
			<%
				}
				}else{
					BbsBiz bbsBiz = new BbsBiz();
					ArrayList<BbsVo> list = (ArrayList<BbsVo>)request.getAttribute("searchAns");
					for(int i = 0; i <list.size(); i++){
				
				%>
			<tr>
				<!-- <td><%= list.get(i).getBbsID() %></td>  -->
				<td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle() %></a></td>
				<td><%= list.get(i).getUserID() %></td>
				<td><%= list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시" + list.get(i).getBbsDate().substring(14, 16) + "분"%></td>
				<td><%= list.get(i).getBbsView()%></td>
			</tr>
			<%
					}
					%>
			</tbody>
			</table>
			<%
				}
				%>
			<!--검색-->
			<form method="post" action="search">
				<div class="search-all">
					<select class="search_select" name="choice">
						<option value="title">제목별</option>
						<option value="userId">작성자별</option>
						<option value="content">내용별</option>
					</select>
					<button class="search_btn" type="submit">검색</button>
					<input class="search" type="text" placeholder="내용을 적어주세요" name="searchText">
				</div>
				<a href="write.jsp" class="btn btn-primary">글쓰기</a>
			</form>
		</div>
	</div>
	
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

	<%-- 여기부터 footer --%>
	<div id="footer">
		<div class="foot">
			<div class="foot_top">
				<h1>
					<img src="image/logo.png" alt="3조 게시판 로고" />
				</h1>
			</div>
			<div class="foot_btm">
				<div class="info">
					<div class="tit">INFO</div>
					<address>
						ADDRESS: 서울특별시 서초구 서초대로46길 42 <span>┃</span> TEL : 012-3456-7890
					</address>
					<p class="copy">COPYRIGHT(C) TEAM M.B.T.I.CO.,LTD. ALL RIGHTS
						RESERVED.</p>
				</div>
				<div class="cc">
					<div class="tit">CUSTOMER CENTER</div>
					<div class="cc_tel">021-1334-5555</div>
				</div>
			</div>
		</div>
	</div>

	
	<!-- //footer -->
	<script src="https://cdn.jsdelivr.net/npm/darkmode-js@1.5.7/lib/darkmode-js.min.js"></script><!--다크모드 설정 -->
	<script src="js/widget.js"></script><!--다크모드 설정 -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/dropdown.js"></script>
</body>
</html>