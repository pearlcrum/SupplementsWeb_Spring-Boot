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
				<h1 class="tit"><img src="image/favicon.png"> 증상별 영양제 추천</h1>
			</div>
			<div class="container">
				<div class="row">
					<table class="table table-striped">
						<tr>
							<td style="width: 20%">
							<img src="https://s3.images-iherb.com/cgn/cgn00965/v/48.jpg" alt=""
								style="width: 200px; height: auto;" /></td>
							<td style="width: 80%"><h3 class="tit-2">1. 피곤할 때 자주
									방광염이나 질염이 생긴다면 유산균</h3>
								<p class="info-content">
									비뇨기 염증에는 유산균을 추천한다.<br> 
									신체 구조상 균이 직접적으로 이동할 수 있어 발생하는 경우가 빈번하다.<br> 
									따라서 유산균을 섭취하면 유해한 세균의 이동을 막아 방광염, 질염을 예방할 수 있다.<br>
									<a href="https://kr.iherb.com/pr/california-gold-nutrition-lactobif-probiotics-30-billion-cfu-60-veggie-capsules/64009" class="btn btn-primary">더보기</a>
								</p></td>
						<tr>
							<td style="width: 20%">
							<img src="https://s3.images-iherb.com/nfs/nfs02072/v/36.jpg" alt=""
								style="width: 200px; height: auto; margin-top:20px;" /></td>
							<td style="width: 80%"><h3 class="tit-2">2. 피곤하다면 종합비타민, 비타민C, 코엔자임Q10</h3>
								<p class="info-content">
									수면부족, 운동부족, 정신적인 스트레스로 인해서 피곤할 때는 영양제를 먹으면 몸의 기능을 회복하는 데 도움이 될 수 있다.<br> 
									먼저 종합비타민을 추천할 만하다.항피로 비타민으로 알려진 비타민B1 외에도 비타민 B2·B3·B5·B6 등 다양한 비타민B가 들어 있어 에너지 대사에 관여하기 때문이다.<br>
									또한 비타민B군 외에도 마그네슘 등 다양한 미네랄과 미량원소가 들어 있어서 피로회복에 효과적이다. 비타민B군이 함유된 종합비타민제만으로 피로감이 충분히 줄어들지 않는 경우 비타민C의 도움을 받을 수 있다. 
									식사 후에 1000mg를 1~2알 먹으면 된다.<br>
									이 두 가지 영양제로도 피곤함이 가시지 않으면 코엔자임 Q10을 100mg 정도 추가로 먹을 수 있다. 항산화제인 코엔자임 Q10은 에너지 생성에 중요한 역할을 하는 조효소이다.<br> 
									<a href="https://kr.iherb.com/pr/natural-factors-coenzyme-q10-100-mg-120-softgels/12955" class="btn btn-primary">더보기</a>
								</p></td>
						<tr>
							<td style="width: 20%">
							<img src="https://s3.images-iherb.com/nap/nap03366/v/5.jpg" alt="" style="width: 200px; height: auto; display: block; margin-top:20px;" /></td>
							<td style="width: 80%"><h3 class="tit-2">3. 고혈압이 있을 때 종합비타민, 칼슘·마그네슘 복합 제제</h3>
								<p class="info-content">
									칼슘, 마그네슘이 부족한 경우 혈압 조절이 안 되고 고혈압으로 인한 각종 부작용이 증가할 수 있다.<br>
									물론 영양제를 먹는다고 해서 약물처럼 혈압을 떨어뜨리는 효과를 볼 수 있는 건 아니다. 
									그러나 영양제 섭취는 여러 가지 약물로 인한 영양소의 결핍을 막고, 고혈압 때문에 생길 수 있는 체내 염증 반응과 조직의 손상을 막는 데 도움이 된다.<br> 
									혈압약으로 결핍될 수 있는 영양소의 종류가 워낙 많기 때문에 한 가지씩 보충하는 것보다 종합비타민제의 형태로 보충하는 것이 좋다.<br> 
									이에 더해 칼슘과 마그네슘이 함께 들어 있는 복합 제제를 추가적으로 하루에 한 알 정도 섭취하면 된다.<br> 
									칼슘·마그네슘 제제는 신경을 안정시키는 역할을 하므로,저녁 식사 후에 먹는 것이 좋다.<br> 
									<a href="https://kr.iherb.com/pr/nature-s-plus-cal-mag-zinc-180-tablets/51157" class="btn btn-primary">더보기</a>
								</p></td>
						<tr>
							<td style="width: 20%">
							<img src="https://s3.images-iherb.com/cgn/cgn01179/v/128.jpg" alt=""
								style="width: 200px; height: auto; margin-top:20px;" /></td>
							<td style="width: 80%"><h3 class="tit-2">4. 치매가 걱정된다면 오메가3, 종합비타민, 비타민D</h3>
								<p class="info-content">
									오메가3에 든 성분인 DHA와 EPA는 대표적인 뇌 건강 영양소로 알려져 있다.<br> 
									오메가3를 많이 섭취할수록 치매를 일으키는 베타아밀로이드의 혈중 수치가 낮아진다.<br> 
									뇌기능이 저하되기 시작하면 800~1200mg의 DHA가 필요하다.<br> 
									유해산소의 생성이 증가하면 뇌세포의 손상도 증가한다.<br>
									항산화 영양소를 섭취해서 뇌기능을 유지하는 데 효과를 볼 수 있다.
									 이를 위해서는 셀레늄, 비타민E, 비타민C, 다양한 파이토케미컬이 풍부한 종합비타민제를 추천한다. 
									 비타민D도 치매 예방에 도움이 되는 영양제다.<br> 
									<a href="https://kr.iherb.com/pr/california-gold-nutrition-vitamin-d3-50-mcg-2-000-iu-90-fish-gelatin-softgels/77548" class="btn btn-primary">더보기</a>
								</p></td>
						<tr>
							<td style="width: 20%"><img src="https://s3.images-iherb.com/jrw/jrw09002/v/45.jpg" alt=""
								style="width: 200px; height: auto; margin-top:20px;" /></td>
							<td style="width: 80%"><h3 class="tit-2">5. 피부 트러블로 고생할 때 종합비타민, 감마리놀렌산</h3>
								<p class="info-content">
									뾰루지 같은 피부 트러블이나 진단명이 나오지 않는 피부 습진으로 고생할 때 영양제의 도움을 받을 수 있다.<br>
									먼저 종합비타민제에 들어 있는 비타민 A·B·D, 비오틴, 아연 등 여러 가지 성분이 피부 트러블을 조절하는 데 도움이 된다.<br> 
									또한 감마리놀렌산은 우리 몸에서 강력하게 염증을 줄이는 항염 성분이다.<br>
									감마리놀렌산은 식품으로 섭취하기 어려워 대부분 영양제로 섭취한다.<br> 
									<a href="https://kr.iherb.com/pr/jarrow-formulas-evening-primrose-1-300-mg-60-softgels/228" class="btn btn-primary">더보기</a>
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