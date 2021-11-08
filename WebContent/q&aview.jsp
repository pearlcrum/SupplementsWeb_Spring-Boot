<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.io.PrintWriter" %>
<%@ page import="com.vo.*"%>
<%@ page import="com.biz.*" %>
<%@ page import="java.util.*" %>
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
		int bbsID = 0;
		if(request.getParameter("bbsID") != null){
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if(bbsID ==0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'bbs2.jsp'");
			script.println("</script>");
			
		}
		BbsVo2 bbsVo = new BbsBiz2().getBBSByID(bbsID);
		int viewNum= new BbsBiz2().getBBSView(bbsVo.getBbsID());
		int resView=new BbsBiz2().plusBbsView(bbsVo.getBbsID(), viewNum);
		ArrayList<BbsCommentVo2> CommentList= new BbsCommentBiz2().getAllComments(bbsVo.getBbsID());
		
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
  	if(userID == null){
  		  	
  %>
    <ul class="nav navbar-nav navbar-right">
   <li class="dropdown">
    <a href="#" class="dropddown-toggle"
    data-toggle="dropdown" role="button" aria-haspopup="true"
    aria-expanded="false">접속하기<span class="caret"></span></a>
   <ul class="dropdown-menu">
    <li class="active"><a href="login.jsp">로그인</a></li>        <!-- active : 선택이 됨을 알려줌 -->
    <li ><a href="join.jsp">회원가입</a></li>
   </ul>
  </li>
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
		<table class="table table-striped">
		<thead>
			<tr>
				<th colspan="3" class="view-tit">게시판 글 보기</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td class="table-style-1" style="width: 20%;">제목</td>
					<td class="table-style-2" colspan= "2"><%= bbsVo.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
							.replaceAll("\n", "<br>") %></td>
				</tr>
					<tr>
					<td class="table-style-1" style="width: 20%;">작성자</td>
					<td class="table-style-2" colspan= "2"><%= bbsVo.getUserID() %></td>
				</tr>
				<tr>
					<td class="table-style-1" style="width: 20%;">작성일</td>
					<td class="table-style-2" colspan= "2"><%= bbsVo.getBbsDate().substring(0, 11) + bbsVo.getBbsDate().substring(11, 13) + "시" + bbsVo.getBbsDate().substring(14, 16) + "분"%></td>
				</tr>
				<tr>
					<td class="table-style-1" style="width: 20%;">첨부파일</td>
					<td class="table-style-2" colspan= "2"><%= bbsVo.getUserID() %></td>
				</tr>
				<tr>
					<td class="table-style-1" style="width: 20%;">내용</td>
					<td class="table-style-2" colspan="2" style="min-height: 200px; text-align: justify;"><%= bbsVo.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
					.replaceAll("\n", "<br>")%></td>
				</tr>
				</tbody>
				</table>
				<a href="q&a.jsp" class="btn btn-primary">목록</a>
				<%
					if(userID != null && userID.equals(bbsVo.getUserID())){
				%>
				<a onClick="return confirm('정말로 수정하시겠습니까?')" href="find?bbsID=<%=bbsID %>" class="btn btn-primary">수정</a>
				<a onClick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction2.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">삭제</a>
				<%
					}
				%>		
		</div>
	</div>

		<div class="container" style="background-color: #FCF6F5; border: 2px solid #7b9acc;">
			<div class="comment">
			<span class="view-tit2"> 댓글 쓰기</span>
			<form method="post" action="comment" class="comment">
			<input type="hidden" class="a" placeholder="게시글ID" name="bbsID" value="<%=bbsID%>"> 
			<input type="hidden" class="a" placeholder="유저ID" name="userID" value="<%=userID%>">
     		<textarea type="text" class="form-control" class="a" placeholder="댓글을 입력하세요" name="comment" maxlength="100" rows="3"></textarea>
   			<input type="submit" class="btn btn-primary" value="입력">
   		</form>
    		</div>		
		</div>
	

	<%
		if (CommentList != null) {
	%>
	
	<div class="container">
	<div class="row">
	<table class="table table-striped">
		<thead>
			<tr>
				<th colspan="4" class="view-tit">댓글 보기</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<th class= "table-style-1" style="width: 20%;">ID</th>
				<th class= "table-style-1" style="width: 60%;">댓글 내용</th>
				<th class= "table-style-1" style="width: 10%;">수정</th>
				<th class= "table-style-1" style="width: 10%;">삭제</th>
			</tr>
					<%
						for (BbsCommentVo2 ar : CommentList) {
						out.print("<tr><td>" + ar.getUserID() + "</td>");
						out.print("<td>" + ar.getCommentText() + "</td>");
						if (ar.getUserID().equals(userID)) {
							out.print("<td> <a href =findComment?no=" + ar.getCommentID() + "> 수정</a></td>");
							out.print("<td> <a href =deleteComment?no=" + ar.getCommentID() + "> 삭제</a></td>");
						}
						out.print("</tr>");
					}
					}
					%>
				</tbody>
			</table>
			</div>
			</div>
			
			<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
			<script src="js/bootstrap.js"></script>
</body>
</html>