<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
	$(document).ready(function() {
		var stickyNavTop = $('.nav').offset().top;
		var stickyNav = function() {
			var scrollTop = $(window).scrollTop();
			if (scrollTop > stickyNavTop) {
				$('.nav').addClass('sticky');
			} else {
				$('.nav').removeClass('sticky');
			}
		};
		stickyNav();
		$(window).scroll(function() {
			stickyNav();
		});
	});
</script>
<style type="text/css">
* {
	font-family: 'Jua', sans-serif;
}

body {
	margin: 0;
	padding: 0;
}

.header {
	padding: 25px 0;
	background-color: #000;
}

.nav {
	padding: 25px 0;
	background-color: red;
	position: -webkit-sticky;
}

.header, .nav {
	text-align: center;
	color: #fff;
}

.content {
	width: 600px;
	margin: 10px auto 100px;
}

.sticky {
	position: fixed;
	width: 100%;
	left: 0;
	top: 0;
	z-index: 100;
	border-top: 0;
}
</style>
</head>
<body>

	<nav class="navbar-fixed-top" style="background-color: white">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#"> <img alt="" src="/icade/resources/data/logo/logo2.png" style="width: 180; height: 50;"></a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar" style="color: #8F9493; font-size: 25px; margin-top: 15px;">
				<ul class="nav navbar-nav">
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: #8F9493"> 케이스 </a>
						<ul class="dropdown-menu">
							<li>
								<a href="#">일반</a>
							</li>
							<li>
								<a href="#">주문제작</a>
							</li>
						</ul>
					</li>
					<li>
						<a href="#" style="color: #8F9493">필름</a>
					</li>
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: #8F9493"> 악세서리 </a>
						<ul class="dropdown-menu">
							<li>
								<a href="#">케이블</a>
							</li>
							<li>
								<a href="#">충전기</a>
							</li>
						</ul>
					</li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li>
						<a href="#" style="color: #8F9493"> <span class="glyphicon glyphicon-user"></span> 로그인
						</a>
					</li>
					<li>
						<a href="#" style="color: #8F9493"> <span class="glyphicon glyphicon-shopping-cart"></span> 장바구니
						</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="jumbotron" style="height: 300px; background-color: white; margin-top: 40px;">
		<div class="container text-center">
			<img alt="" src="/icade/resources/data/logo/logo1.png">
		</div>
	</div>

	<nav class="navbar" style="width: 500px;">
		<div class="container-fluid">
			<div class="collapse navbar-collapse" id="myNavbar">
				<div align="center" style="margin-top: 25px;">
					<form class="form-inline">
						<input type="text" class="form-control" size="50" placeholder="검색할 단어를 입력하세요" style="font-size: 20px; width: 300px; height: 40px;">
						<button type="button" class="btn btn-danger" style="font-size: 20px; width: 100px; height: 40px; color: #A3C838; border-color: #A3C838; background-color: white;">검색</button>
					</form>
				</div>
			</div>
		</div>
	</nav>

</body>
</html>