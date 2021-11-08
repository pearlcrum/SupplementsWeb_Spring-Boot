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
				<li class="active"><a href="main.jsp">메인</a></li>

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

	<%-- 여기부터 메인 --%>
	<div class="container">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="item active">
					<img src="image/main_1.png">
				</div>
				<div class="item">
					<img src="image/main_2.png">
				</div>
				<div class="item">
					<img src="image/main_3.png">
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
	</div>

       <%-- 여기부터 영양제 소개 --%>
        <!-- Our Shop-->
      <section class="section">
        <div class="container">
         <div class="tit"><h3><img src="image/search.png" /> 지금 인기 있는 영양제는?</h3></div>
          <div class="row row-lg row-30">
            <div class="col-sm-6 col-lg-4 col-xl-3">
              <!-- Product-->
              <article class="product wow fadeInLeft">
                <div class="product-figure"><img src="https://s3.images-iherb.com/cgn/cgn00934/v/98.jpg" alt="" width="160" height="160" style="margin-left: 30px;"/>
                </div>
                <div class="product-rating"><span class="mdi mdi-star"></span><span class="mdi mdi-star"></span><span class="mdi mdi-star"></span><span class="mdi mdi-star"></span><span class="mdi mdi-star text-gray-13"></span>
                </div>
                <h6 class="product-title">California Gold Nutrition, Gold C</h6>
                <div class="product-price-wrap">
                  <div class="product-price">₩10,722</div>
                </div>
                <div class="product-button">
                  <div class="button-wrap"><a class="button button-xs button-secondary button-winona" href="https://kr.iherb.com/pr/california-gold-nutrition-gold-c-vitamin-c-500-mg-240-veggie-capsules/61866">View Product</a></div>
                </div>
              </article>
            </div>
            <div class="col-sm-6 col-lg-4 col-xl-3">
              <!-- Product-->
              <article class="product wow fadeInLeft">
                <div class="product-figure"><img src="https://s3.images-iherb.com/aer/aer03019/v/47.jpg" alt="" width="160" height="160" style="margin-left: 30px;"/>
                </div>
                <div class="product-rating"><span class="mdi mdi-star"></span><span class="mdi mdi-star"></span><span class="mdi mdi-star"></span><span class="mdi mdi-star"></span><span class="mdi mdi-star text-gray-13"></span>
                </div>
                <h6 class="product-title">NB Pure, Mag O7</h6>
                <div class="product-price-wrap">
                  <div class="product-price">₩30,915</div>
                </div>
                <div class="product-button">
                  <div class="button-wrap"><a class="button button-xs button-secondary button-winona" href="https://kr.iherb.com/pr/nb-pure-mago7-digestive-cleanse-detox-90-capsules/68265">View Product</a></div>
                </div>
              </article>
            </div>
            <div class="col-sm-6 col-lg-4 col-xl-3">
              <!-- Product-->
              <article class="product">
                <div class="product-figure"><img src="https://s3.images-iherb.com/nel/nel12990/v/18.jpg" alt="" width="160" height="160" style="margin-left: 30px;"/>
                </div>
                <div class="product-rating"><span class="mdi mdi-star"></span><span class="mdi mdi-star"></span><span class="mdi mdi-star"></span><span class="mdi mdi-star"></span><span class="mdi mdi-star text-gray-13"></span>
                </div>
                <h6 class="product-title">Neocell, Super Collagen Type 1 & 3</h6>
                <div class="product-price-wrap">
                  <div class="product-price">₩19,383</div>
                </div>
                <div class="product-button">
                  <div class="button-wrap"><a class="button button-xs button-secondary button-winona" href="https://kr.iherb.com/pr/neocell-super-collagen-type-1-3-berry-lemon-6-600-mg-6-7-oz-190-g/85079">View Product</a></div>
                </div>
              </article>
            </div>
          </div>
          <a class="btn btn-primary" href="infoENS.jsp" role="button">더보기</a>
        </div>
      </section>
      
      <section class="section section-md bg-default">
        <div class="container">
           <div class="tit"><h3><img src="image/YouTube.png" /> 약사가 추천하는 영양제</h3></div>
          <div class="row row-md row-30">
            <div class="col-sm-6 col-lg-4">
              <div>
                <!--1-->
                <article>
                  <div>
                  <iframe width="370" height="278" src="https://www.youtube.com/embed/kDXMPUDQK4I" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                  </div>
                  <div>
                    <h4><a href="https://youtu.be/kDXMPUDQK4I">50만 채널 약사가 먹고 있는 영양제는 바로 이겁니다!!</a></h4>
                  </div>
                </article>
              </div>
            </div>
            <div class="col-sm-6 col-lg-4">
              <div>
                <!--2-->
                <article>
                  <div>
                  <iframe width="370" height="278" src="https://www.youtube.com/embed/5Rzy0WZO29M" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                  </div>
                  <div>
                    <h4><a href="https://youtu.be/5Rzy0WZO29M">엄마들 사이에서 입소문난 국내 vs 해외 키즈영양제! 현직 약사 전격 리뷰!</a></h4>
                  </div>
                </article>
              </div>
            </div>
            <div class="col-sm-6 col-lg-4">
              <div>
                <!--3-->
                <article>
                  <div>
                  <iframe width="370" height="278" src="https://www.youtube.com/embed/prNzrNVGKGM" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                  </div>
                  <div>
                    <h4><a href="https://youtu.be/prNzrNVGKGM">약사가 추천하는 필수영양제 5가지 !</a></h4>
                  </div>
                </article>
              </div>
            </div>
          </div>
          <a class="btn btn-primary" href="newsVideo.jsp" role="button">더보기</a>
        </div>
      </section>


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