<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device" ,initial-scale="1">
<link href="image/favicon.png" rel="shortcut icon">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>SupplementsWeb</title>
<style>
	.multi{
		column-count: 2;
	}
</style>
</head>
<body>
	<%
		String userID = null;
	if (session.getAttribute("userID") != null) {
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
			<a class="navbar-brand" href="main.jsp"><img alt="logo" src="image/logo.png" style= "margin-top: -30px; height: 80px"></a>
		</div>

		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>

				<li class="active"><a href="infoENS.jsp">영양제 소개</a>
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
					<li><a href="#">회원 정보 수정</a></li>
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

	<%-- 여기부터 메인 --%>
	<tbody>
		<td class="info-bg">
			<div class="heading-section">
				<h1 class="tit"><img src="image/favicon.png"> 같이 섭취하면 좋지 않은 영양제</h1>
			</div>
			<div class="container">
				<div class="row">
					<table class="table table-striped">
						<tr>
							<td ><h3 class="tit-2">1. 칼슘 / 마그네슘  + 철분</h3>
								<p class="info-content">
								칼슘, 마그네슘과 철분은 체내에 흡수되는 통로가 동일하다.<br>
								 따라서 칼슘/마그네슘과 철분은 "식사 전"에 철분을 "식사 후"에 칼슘 /마그네슘을 섭취하는 것을 권장한다.<br>
								</p></td>
						<tr>
							<td><h3 class="tit-2">2. 오메가3 + 감마리놀레산 </h3>
								<p class="info-content">
									감마리놀레산에 오메가6 지방산이 들어가 있어 같이 복용하게 되면 오메가3의 효능이 감소하므로 같이 복용하지 않는 것을 권장한다.<br>
								</p></td>
						<tr>
							<td><h3 class="tit-2">3. 항생제  + 유산균</h3>
								<p class="info-content">
									항생제는 균을 죽이는 역할을 하기 때문에 균의 한 종류인 유산균과 함께 섭취하면 유산균이 죽는다.<br>
									따라서 따로 아침에 공복에 유산균을 섭취하고 식사 후에 항생제를 섭취하는 것을 권장한다.<br>
								</p></td>
						<tr>
							<td><h3 class="tit-2">4. 비타민B1 + 타닌</h3>
								<p class="info-content">
									비타민B1은 타닌과 만나면 흡수가 잘되지 않는다.<br>
			 						따라서 비타민B1을 먹을 때는 타닌이 포함된 종합 영양제를 피하는 것을 권장한다.<br>
								</p></td>
						<tr>
							<td><h3 class="tit-2">5. 비타민A + 루테인</h3>
								<p class="info-content">
									함량에 따라 다르지만, 비타민A와 루테인을 모두 고함량으로 섭취하면 비타민A 과잉 상태가 될 수 있다.<br>
									비타민A 과잉 상태가 되면 구토·두통·설사 증상이 나타날 수 있다.<br>
									루테인이 비타민A의 일종이기 때문이다. 이외에 레티놀과 베타카로틴도 비타민A의 역할을 하므로 주의해야 한다. <br>
								</p></td>
					</table>
				</div>
			</div>
		</td>
	</tbody>
	
	<br><br><br><br><br><br>
	
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