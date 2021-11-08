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
	<tbody>
		<td class="info-bg">
			<div class="heading-section">
				<h1 class="tit"><img src="image/favicon.png"> 현대인 필수 영양제</h1>
			</div>
			<div class="container">
				<div class="row">
					<table class="table table-striped">
						<tr>
							<td style="width: 20%">
							<img src="image/info1.jpg" alt="" style="width: 200px; height: auto; margin-top:50px;" /></td>
							<td style="width: 80%"><h3 class="tit-2">1. 종합 영양제</h3>
								<p class="info-content">
								채소와 과일에서 추출한 비타민, 미네랄을 농축해 만들었으며 피로 해소와 각종 질병 예방 등을 돕는다. 그러나 여러 성분을 골고루 집약해 담다 보니 특정 성분이 하루 권장량에 미치지 않을 수 있어 유의해야 한다.<br>
			 					예를 들어 종합영양제에 보통 칼슘이 40~160mg 들어 있지만, 성인 여성 하루 칼슘 권장량은 1,000~1,500mg이므로 칼슘을 추가로 복용해야 한다.<br>
								  비타민 D 결핍이 많은 노인들 역시 종합영양제만으로는 영양을 충분히 섭취하기 어렵다는 문제가 있기 때문에 확인이 필요하다.<br>
									<a href="https://kr.iherb.com/search?kw=%EC%A2%85%ED%95%A9%20%EC%98%81%EC%96%91%EC%A0%9C" class="btn btn-primary">더보기</a>
								</p></td>
						<tr>
							<td style="width: 20%">
							<img src="image/info2.jpg" alt="" style="width: 200px; height: auto; margin-top:50px;" /></td>
							<td style="width: 80%"><h3 class="tit-2">2. 오메가-3 </h3>
								<p class="info-content">
									생선이나 물범, 호박씨 등에서 추출되는 오메가-3 지방산은 신체의 대사 작용에 필수적인 영양소이지만 인체 내에서 합성되지 않아 반드시 음식이나 영양제 등으로 섭취해야 한다.<br>
			 					오메가-3를 구성하는 EPA와 DHA 성분은 콜레스테롤 수치를 떨어트리고 혈압, 당뇨 등에 효과가 있으며 뇌세포 기능을 증가시키는 데 도움을 준다.<br>
			 					 하루 최소 1,500mg 이상을 섭취해야 하기 때문에 제품 구입 시 중금속, 환경호르몬의 우려가 비교적 적은 소형 어류(정어리, 멸치 등)에서 추출한 제품인지, 고온에서 추출해 산화 위험이 있는 것은 아닌지 따져보는 것이 좋다.<br>
									<a href="https://kr.iherb.com/search?kw=%EC%98%A4%EB%A9%94%EA%B0%803" class="btn btn-primary">더보기</a>
								</p></td>
						<tr>
							<td style="width: 20%">
							<img src="image/info3.jpg" alt="" style="width: 200px; height: auto; display: block; margin-top:50px;" /></td>
							<td style="width: 80%"><h3 class="tit-2">3. 비타민D</h3>
								<p class="info-content">
									비타민 D는 골다공증 위험이 있는 갱년기 여성이나 피부 노화로 비타민 D를 잘 합성하지 못하는 노인에게 특히 강조되곤 한다.<br>
							 제품을 고를 때는 하루 권장 섭취량인 200~400IU를 충족하는지 확인해야 하는데, 체외 배출이 되지 않으므로 과잉 섭취는 금물이다.
							  또한 합성비타민은 흡수율이 떨어지고, 인체에 부정적인 영향을 줄 가능성이 제기됐으므로 천연 원료로 만든 제품인지 확인해 보자.<br>
			   			뒷면을 봤을 때 ‘비타민 D’처럼 영양 성분만 표기됐다면 합성비타민, ‘건조효모(비타민 D 0.02%)’처럼 천연 원료와 영양 성분이 함께 표기됐다면 천연비타민 D다.<br>
									<a href="https://kr.iherb.com/search?kw=%EB%B9%84%ED%83%80%EB%AF%BCD" class="btn btn-primary">더보기</a>
								</p></td>
						<tr>
							<td style="width: 20%">
							<img src="image/info4.jpg" alt="" style="width: 200px; height: auto; margin-top:50px;" /></td>
							<td style="width: 80%"><h3 class="tit-2">4. 칼슘/마그네슘</h3>
								<p class="info-content">
									한국인이 가장 적게 섭취하는 영양소는 바로 칼슘으로 하루에 1,000mg 정도가 요구된다. 그러나 한 번에 500mg 이상의 칼슘은 흡수하기 어렵기 때문에 가급적 나눠서 복용하는 게 좋다.<br>
			 				 특히 칼슘은 마그네슘과 함께 섭취할 때 흡수율이 더 높아진다.시중에 칼슘과 마그네슘, 그 밖에 비타민 D나 망간 등을 배합한 제품이 많이 출시된 것도 이것 때문이다.<br>
							칼슘과 마그네슘 복합제를 선택할 때는 2대1의 황금 비율인지 살펴보자.<br>
									<a href="https://kr.iherb.com/search?kw=%EC%B9%BC%EC%8A%98%2F%EB%A7%88%EA%B7%B8%EB%84%A4%EC%8A%98" class="btn btn-primary">더보기</a>
								</p></td>
						<tr>
							<td style="width: 20%"><img src="image/info5.jpg"" alt="" style="width: 200px; height: auto; margin-top:30px;" /></td>
							<td style="width: 80%"><h3 class="tit-2">5. 유산균</h3>
								<p class="info-content">
									프로바이오틱스는 장내 유익균의 증식을 도와 배변 활동을 원활히 하는 한편 몸의 면역력을 높이고 각종 질병 예방에도 도움을 준다.<br>
			 제품을 선택할 때는 유산균을 비롯한 세균 함량이 허가 기준치에 도달하는지(균의 양을 세는 단위는 CFU로 1그램당 균 수가 1억~100억 CFU 함량을 넘어야 한다), 유익균이 장까지 얼마나 살아남는지 등을 주의 깊게 확인해야 한다.<br>
			 프로바이오틱스는 위산에 약하기 때문에 공복에 복용하는 게 좋고 상온에서 활동을 시작하기 때문에 주문할 때 냉장 배송이 되는지 꼭 확인해야 한다.<br>
									<a href="https://kr.iherb.com/search?kw=%EC%9C%A0%EC%82%B0%EA%B7%A0" class="btn btn-primary">더보기</a>
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