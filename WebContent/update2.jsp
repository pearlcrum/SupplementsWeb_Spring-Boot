<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="com.vo.*"%>
<%@ page import="com.biz.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width" initial-scale="1">
<link href="image/favicon.png" rel="shortcut icon">
<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>SupplementsWeb</title>
</head>
<body>
	<%
		BbsVo2 bbsVo=(BbsVo2)request.getAttribute("find2");
		//로긴한사람이라면	 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");

		} 
		//로그인 안한 경우
		if(userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
			
		}
		
		int bbsID = 0;
		if (bbsVo.getBbsID() != 0) {
			bbsID = bbsVo.getBbsID();
		}
		if (bbsID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글 입니다.')");
			script.println("location.href = 'bbs2.jsp'");
			script.println("</script>");
		}
		if (!userID.equals(bbsVo.getUserID())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'bbs2.jsp'");
			script.println("</script>");				
		}
	%>


	<!-- 네비게이션  -->
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
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
	<!-- 게시판 --> 
	<div class="container">
		<div class="row">
			<form method="post" action="update2">
				<table class="table table-striped">
					<thead>
						<tr>
							<th colspan="2" class="view-tit">글 수정 </th>
						</tr>
					</thead>
					<tbody>
						<input type="hidden" class="form-control" placeholder="글 번호" name="bbsID" maxlength="10" value="<%= bbsVo.getBbsID() %>" readonly>
						<tr>
						<td class="table-style-1">제목</td>
						<td class="table-style-4"><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50" value="<%= bbsVo.getBbsTitle() %>" ></td>
						</tr>
						<tr>
						<td class="table-style-1">첨부파일</td>
						<td class="table-style-4"><input type="text" class="form-control" placeholder="첨부파일" name="bbsTitle" maxlength="50" value="<%= bbsVo.getBbsTitle() %>" ></td>
						</tr>
						<tr>
						<td class="table-style-1">내용</td>
						<td class="table-style-4"><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px;" ><%= bbsVo.getBbsContent() %></textarea></td>
						</tr>
					</tbody>
				</table>	
				<button type="submit" class="btn btn-primary" >글수정</button>
			</form>
		</div>
	</div>



	<script src="https://cdn.jsdelivr.net/npm/darkmode-js@1.5.7/lib/darkmode-js.min.js"></script><!--다크모드 설정 -->
	<script src="js/widget.js"></script><!--다크모드 설정 -->
	<!-- 애니매이션 담당 JQUERY -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- 부트스트랩 JS  -->
	<script src="js/bootstrap.js"></script>

</body>
</html>