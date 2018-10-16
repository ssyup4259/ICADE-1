<%@page import="org.springframework.http.HttpRequest"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-grid.min.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/icade.css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

<script src="<%=cp%>/resources/data/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var jbOffset = $('.navbar').offset();
		$(window).scroll(function() {
			if ($(document).scrollTop() > jbOffset.top) {
				$('.navbar').addClass('jbFixed');
			} else {
				$('.navbar').removeClass('jbFixed');
			}
		});
	});
</script>

<style type="text/css">

</style>
</head>
<body>


<ul>
  <li><a href="#home">Home</a></li>
  <li><a href="#news">News</a></li>
  <li class="dropdown">
    <a href="javascript:void(0)" class="dropbtn">Dropdown</a>
    <div class="dropdown-content">
      <a href="#">Link 1</a>
      <a href="#">Link 2</a>
      <a href="#">Link 3</a>
    </div>
  </li>
</ul>
	<nav class="navbar-default">
		<div class="navbar-header">
			<a class="navbar-brand" href="#"> <img alt="" src="/icade/resources/data/logo/logo2.png" style="width: 170; height: 40; margin: auto; position: relative; top: -10px;"></a>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar" style="color: #8F9493; font-size: 28px; margin-top: 15px;">
			<ul class="nav navbar-nav">
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: #8F9493">케이스 </a>
					<ul class="dropdown-menu" style="font-size: 20px;">
						<li>
							<a href="#" style="color: #8F9493;">일반</a>
						</li>
						<li>
							<a href="#" style="color: #8F9493;">주문제작</a>
						</li>
					</ul>
				</li>

				<li>
					<a href="#" style="color: #8F9493">필름</a>
				</li>
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: #8F9493"> 악세서리 </a>
					<ul class="dropdown-menu" style="font-size: 20px;">
						<li>
							<a href="#" style="color: #8F9493;">케이블</a>
						</li>
						<li>
							<a href="#" style="color: #8F9493;">충전기</a>
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
	</nav>

	<div class="jumbotron" style="height: 300px; background-color: white; margin-top: 40px;">
		<div class="container text-center">
			<img alt="" src="/icade/resources/data/logo/logo1.png">
		</div>
	</div>

	<div class="container" style="width: 100%;">
		<div id="myCarousel" class="carousel slide" data-ride="carousel" style="width: 100%;">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
			</ol>
			<div class="carousel-inner">
				<div class="item active">
					<img src="/icade/resources/data/img/carousel1.jpg" alt="Los Angeles" style="width: 100%; height: 600px;">
				</div>

				<div class="item">
					<img src="/icade/resources/data/img/carousel2.jpg" alt="Chicago" style="width: 100%; height: 600px;">
				</div>

				<div class="item">
					<img src="/icade/resources/data/img/carousel3.jpg" alt="New york" style="width: 100%; height: 600px;">
				</div>

				<div class="item">
					<img src="/icade/resources/data/img/carousel4.jpg" alt="New york" style="width: 100%; height: 600px;">
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev"> <span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel" data-slide="next"> <span class="sr-only">Next</span>
			</a>
		</div>
	</div>

	<!-- margin-left 발표때 500px정도로 바꿀것 -->
	<div class="navbar text-center" style="width: 500px; margin-left: 700px;">
		<div class="collapse navbar-collapse" id="myNavbar">
			<div align="center" style="margin-top: 25px;">
				<form class="form-inline">
					<input type="text" class="form-control" size="50" placeholder="검색할 단어를 입력하세요" style="font-size: 20px; width: 300px; height: 40px;">
					<button type="button" class="btn btn-danger" style="font-size: 20px; width: 100px; height: 40px; color: #A3C838; border-color: #A3C838; background-color: white;">검색</button>
				</form>
			</div>
		</div>
	</div>

	<!-- 중단 sidebar, container -->
	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-2 sidenav"></div>
			<div class="col-sm-8 text-left">
				<div class="row">

					<div class="container-fluid">
						<font style="color: #8F949; font-size: 30px;"><span class="glyphicons glyphicon-shopping-cart"></span>베스트 상품</font>
						<br>
						<div class="row">
							<div class="col-sm-6">
								<div class="panel panel-success" style="border-color: #A3C838">
									<div class="panel-heading" style="background-color: #A3C838;">BLACK FRIDAY DEAL</div>
									<div class="panel-body">
										<img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width: 100%" alt="Image">
									</div>
									<div class="panel-footer">Buy 50 mobiles and get a gift card</div>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="panel panel-success" style="border-color: #A3C838">
									<div class="panel-heading" style="background-color: #A3C838;">BLACK FRIDAY DEAL</div>
									<div class="panel-body">
										<img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width: 100%" alt="Image">
									</div>
									<div class="panel-footer">Buy 50 mobiles and get a gift card</div>
								</div>
							</div>
						</div>
					</div>

					<div class="container-fluid">
						<br>
						<div class="row">
							<div class="col-sm-6">
								<div class="panel panel-success" style="border-color: #A3C838">
									<div class="panel-heading" style="background-color: #A3C838;">BLACK FRIDAY DEAL</div>
									<div class="panel-body">
										<img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width: 100%" alt="Image">
									</div>
									<div class="panel-footer">Buy 50 mobiles and get a gift card</div>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="panel panel-success" style="border-color: #A3C838">
									<div class="panel-heading" style="background-color: #A3C838;">BLACK FRIDAY DEAL</div>
									<div class="panel-body">
										<img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width: 100%" alt="Image">
									</div>
									<div class="panel-footer">Buy 50 mobiles and get a gift card</div>
								</div>
							</div>
						</div>
						<hr>
					</div>

					<div class="container-fluid">
						<font style="color: #8F949; font-size: 30px;"><span class="glyphicons glyphicon-shopping-cart"></span>신상품</font>
						<br>
						<div class="row">
							<div class="col-sm-3">
								<img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width: 100%" alt="Image">
								<p>Current Project</p>
							</div>
							<div class="col-sm-3">
								<img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width: 100%" alt="Image">
								<p>Project 2</p>
							</div>
							<div class="col-sm-3">
								<img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width: 100%" alt="Image">
								<p>Project 2</p>
							</div>
							<div class="col-sm-3">
								<img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width: 100%" alt="Image">
								<p>Project 2</p>
							</div>
						</div>
					</div>

					<div class="container-fluid">
						<br>
						<div class="row">
							<div class="col-sm-3">
								<img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width: 100%" alt="Image">
								<p>Current Project</p>
							</div>
							<div class="col-sm-3">
								<img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width: 100%" alt="Image">
								<p>Project 2</p>
							</div>
							<div class="col-sm-3">
								<img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width: 100%" alt="Image">
								<p>Project 2</p>
							</div>
							<div class="col-sm-3">
								<img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width: 100%" alt="Image">
								<p>Project 2</p>
							</div>
						</div>
						<hr>
					</div>

					<div class="container-fluid">
						<font style="color: #8F949; font-size: 30px;"><span class="glyphicons glyphicon-shopping-cart"></span>핫딜 상품</font>
						<br>
						<div class="row">
							<div class="col-sm-3">
								<img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width: 100%" alt="Image">
								<p>Current Project</p>
							</div>
							<div class="col-sm-3">
								<img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width: 100%" alt="Image">
								<p>Project 2</p>
							</div>
							<div class="col-sm-3">
								<img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width: 100%" alt="Image">
								<p>Project 2</p>
							</div>
							<div class="col-sm-3">
								<img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width: 100%" alt="Image">
								<p>Project 2</p>
							</div>
						</div>
					</div>

					<div class="container-fluid">
						<br>
						<div class="row">
							<div class="col-sm-3">
								<img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width: 100%" alt="Image">
								<p>Current Project</p>
							</div>
							<div class="col-sm-3">
								<img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width: 100%" alt="Image">
								<p>Project 2</p>
							</div>
							<div class="col-sm-3">
								<img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width: 100%" alt="Image">
								<p>Project 2</p>
							</div>
							<div class="col-sm-3">
								<img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width: 100%" alt="Image">
								<p>Project 2</p>
							</div>
						</div>
						<hr>
					</div>
				</div>
			</div>
			<div class="col-sm-2 sidenav">
				<div class="well">
					<p>ADS</p>
				</div>
				<div class="well">
					<p>ADS</p>
				</div>
			</div>
		</div>
	</div>

	<!-- 하단 -->
	<footer class="container-fluid text-center">
		<p>Footer Text</p>
	</footer>
</body>
</html>