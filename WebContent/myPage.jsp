<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.*"%>
<%@ page import="com.vo.*"%>
<%@ page import="com.biz.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device" ,initial-scale="1">
<link href="image/favicon.png" rel="shortcut icon">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>SupplementsWeb</title>
</head>
<body>

<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	} 
	//로그인 안한 경우
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	}
	UserBiz biz=new UserBiz();
	UserVo vo=biz.getUser(userID);
%>

	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp"><img alt="logo" src="image/logo.png" style= "margin-top: -30px; height: 80px"></a>
		</div>

		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>

				<li><a href="infoENS.jsp">영양제 소개</a>
					<ul class="sub-menu1">
						<li><a href="infoENS.jsp">현대인 필수 영양제</a></li>
						<li><a href="infoCNS.jsp">증상별 영양제 추천</a></li>
						<li><a href="infoNGNS.jsp">같이 섭취하면 좋지 않은 영양제</a></li>
					</ul>
					</li>
				
					
				<li><a href="bbs2.jsp">Q&A 게시판</a>
					</li>
					
					<li><a href="bbs.jsp">후기 게시판</a>
					</li>
					
				<li><a href="newsVideo.jsp">NEWS & VIDEO</a>
					</li>
				
				<li><a href="myPage.jsp">마이페이지</a>
				<ul class="sub-menu2">
					<li><a href="myPage.jsp">회원 정보 수정</a></li>
					</ul>
					</li>
		</ul>

		
			<%
				if (userID == null) {
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

					</ul>
					</li>
			</ul>
			<%
				}
			%>
		</div>
	</nav>

<!-- 유저 정보 확인 -->

	<div class="container" style="margin-bottom: 20px;">
	<div class="row">
		<table class="table table-striped">
		<thead>
			<tr>
				<th class="view-tit" colspan="5" >나의 정보</th>
				</tr>
				</thead>
			<tr>
			<th class="table-style-1" style="width: 20%;">유저 아이디</th> 
			<th class="table-style-1" style="width: 20%;">이름</th> 
			<th class="table-style-1" style="width: 20%;">성별</th> 
			<th class="table-style-1" style="width: 20%;">Email</th> 
			<th class="table-style-1" style="width: 20%;">생년월일</th>
		</tr>
		<% 
		
		    out.print("<tr><td>"+vo.getUserID()+"</td>");
			out.print("<td>"+vo.getUserName()+"</td>");
			out.print("<td>"+vo.getUserGender()+"</td>");
			out.print("<td>"+vo.getUserEmail()+"</td>");
			out.print("<td>"+vo.getUserBirth()+"</td>");
			out.print("</tr>");
		%>
		
		</table>
		</div>
		</div>
		
		<div class="container">
				<div class="row">
					<table class="table table-striped">
				<thead>
					<tr>
						<th colspan="5" class="view-tit">나의 정보 수정</th>
					</tr>
				</thead>
						<tr>
							<td class="table-style-1" style="width: 30%; vertical-align: middle;"> 
							<form method="post" action="updateUserPassword">
							<input style="top: 50px;" type="hidden" name="no" maxlength="50" value="<%=vo.getUserID()%>"> 변경하고자 하는 비밀번호</td>
							<td>
							<input class="info-edit" type="text" name="password" maxlength="50">
							<button type="submit" class="btn btn-primary" style="width: 120px;">비밀번호 변경</button>
							</form>
							</td>
							
						<tr>
							<td class="table-style-1" style="width: 30%; vertical-align: middle;"> 
							<form method="post" action="updateUserEmail">
							<input type="hidden" name="no" maxlength="50" value="<%=vo.getUserID()%>"> 변경하고자 하는 이메일</td>
							<td> 
							<input class="info-edit" type="text" name="email" maxlength="50">
							<button type="submit" class="btn btn-primary" style="width: 120px;">이메일 변경</button>
							</form>
							</td>
							</table>
							
							
							<form method="post" action="deleteUser">
							<input type="hidden" name="userID" maxlength="50" value="<%=vo.getUserID()%>">
							<button type="submit" class="btn btn-primary" style="width: 200px; margin-top: -10px;">계정 삭제</button>
							</form>
					</div>
					</div>
							
		




	<script src="https://cdn.jsdelivr.net/npm/darkmode-js@1.5.7/lib/darkmode-js.min.js"></script><!--다크모드 설정 -->
	<script src="js/widget.js"></script><!--다크모드 설정 -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/dropdown.js"></script>
</body>
</html>