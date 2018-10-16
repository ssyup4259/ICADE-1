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
<link rel="stylesheet" href="<%=cp%>/resources/data/css/sangyeop.css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

<script src="<%=cp%>/resources/data/js/bootstrap.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>

<style type="text/css">
.sticky {
	position: sticky;
	top: 2px;
}

.sticky2 {
	position: sticky;
	top: 200px;
}
</style>
</head>
<body>
	<div class="navbar container-fluid topFixed" style="z-index: 90;">
		<ul>
			<li>
				<img src="/icade/resources/data/logo/logo2.png" width="140" height="47" style="cursor: pointer;" onclick="';">
			</li>

			<li class="dropdown">
				<a href="javascript:void(0)" class="dropbtn">케이스</a>
				<div class="dropdown-content">
					<a href="<%=cp%>/ikeloom/list.do?g_room=livingroom&g_kind_num=11">일반</a> <a href="<%=cp%>/ikeloom/list.do?g_room=livingroom&g_kind_num=11">주문제작</a>
				</div>
			</li>
			<li class="dropdown">
				<a href="javascript:void(0)" class="dropbtn">필름</a>
			</li>
			<li class="dropdown">
				<a href="javascript:void(0)" class="dropbtn">악세서리</a>
				<div class="dropdown-content">
					<a href="<%=cp%>/ikeloom/list.do?g_room=livingroom&g_kind_num=11">케이블</a> <a href="<%=cp%>/ikeloom/list.do?g_room=livingroom&g_kind_num=11">충전기</a>
				</div>
			</li>

			<li style="float: right">
				<a href="<%=cp%>/ikeloom/created.do">회원가입</a>
			</li>
			<li style="float: right">
				<a href="<%=cp%>/ikeloom/login.do">로그인</a>
			</li>
		</ul>
	</div>

	<div class="container-fluid text-center" style="margin-top: 57px;">
		<img src="/icade/resources/data/logo/logo1.png">
	</div>

	<ul class="carousel">
		<li>
			<img src="/icade/resources/data/img/carousel1.jpg">
		</li>
		<li>
			<img src="/icade/resources/data/img/carousel2.jpg">
		</li>
		<li>
			<img src="/icade/resources/data/img/carousel3.jpg">
		</li>
	</ul>

	<div class="container-fluid sticky" style="width: 500px; z-index: 999;">
		<div class="collapse navbar-collapse" id="myNavbar">
			<div align="center" style="margin-top: 25px;">
				<form class="form-inline">
					<input type="text" class="inputBox" placeholder="검색할 단어를 입력하세요" style="width: 300px;">
					<button type="button" class="btn" style="width: 100px;">검색</button>
				</form>
			</div>
		</div>
	</div>


	<!-- 중단 sidebar, container -->
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="container-fluid col-sm-8">
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
					<br>
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

		<div class="col-sm-2"></div>


	</div>




</body>
</html>