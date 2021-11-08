<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device",initial-scale="1">
<link href="image/favicon.png" rel="shortcut icon">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>SupplementsWeb</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
	
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
 <a class="navbar-brand" href="main.jsp"><img alt="" src="image/logo.png" style= "margin-top: -30px; height: 80px"></a>
 </div>
 <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
  <ul class="nav navbar-nav">
   <li><a href="main.jsp">메인</a></li>
   <li><a href="infoENS.jsp">영양제 소개</a>
   <li class="active"><a href="bbs2.jsp">Q&A 게시판</a></li>
   <li><a href="bbs.jsp">후기 게시판</a></li>
   <li><a href="newsVideo.jsp">NEWS & VIDEO</a></li>
   <li><a href="myPage.jsp">마이페이지</a></li>
  </ul>
  <%
  	if(userID == null){
  		  	
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


				<li class="active"><a href="bbs2.jsp">Q&A 게시판</a></li>

				<li><a href="bbs.jsp">후기 게시판</a></li>

				<li><a href="newsVideo.jsp">NEWS & VIDEO</a></li>

				<li><a href="myPage.jsp">마이페이지</a>
					<ul class="sub-menu2">
						<li><a href="#">회원 정보 수정</a></li>
					</ul></li>
			</ul>
  <%
  	} else {
  %>
  
      <ul class="nav navbar-nav navbar-right">
   <li class="dropdown">
    <a href="#" class="dropddown-toggle"
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
<div class="container">
<div class="row">
	<form method="post" action="writeAction2.jsp" enctype="multipart/form-data">
	<table class="table table-striped">
		<thead>
			<tr>
				<th colspan="2" class="view-tit">게시판 글쓰기</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td class="table-style-1" style="vertical-align: middle;">제목</td>
					<td class="table-style-4"><input type="text" class="form-control" placeholder="글 제목을 입력해주세요." name="bbsTitle" maxlength="50"></td>
					</tr>
				<tr>
					<td class="table-style-1" style="vertical-align: middle;">내용</td>
					<td class="table-style-4"><textarea type="text" class="form-control" placeholder="글 내용을 입력해주세요." name="bbsContent" maxlength="2048" style="height: 350px"></textarea></td>
				</tr>
				<tr>
					<td class="table-style-1" style="vertical-align: middle;">첨부파일</td>
					<td class="table-style-4"><input type="file" name="file_name2"></td>
					</tr>
				</tbody>
				</table>
				<input type="submit" class="btn btn-primary" value="글쓰기">
				</form>
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