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
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-panel.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/sangyeop.css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

<script src="<%=cp%>/resources/data/js/bootstrap.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>

<style type="text/css">
.sticky {
	position: sticky;
	top: 0px;
}

.sticky2 {
	position: sticky;
	top: 3px;
}
</style>
</head>
<body>
	<div class="container-fluid text-center event" style="background-color: #DDDADB; font-size: 26px; vertical-align: middle;">
		GRAND OPEN!! 회원가입 시 2000포인트 증정!
		<img src="/icade/resources/data/img/close.png" onclick="$('.event').slideUp(400);" style="cursor: pointer; vertical-align: middle;">
	</div>

	<div class="navbar container-fluid sticky" style="z-index: 90;">
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

	<div class="container-fluid sticky2" style="width: 700px; z-index: 999;">
		<div class="collapse navbar-collapse" id="myNavbar">
			<div align="center" style="margin-top: 25px;">
				<form class="form-inline" action="" name="searchForm" method="post">
					<input type="hidden" name="GK_KIND_NUM" value="${GK_KIND_NUM}" />
					<select name="searchKey" class="sel1" style="width: 100px;">
						<option value="G_NAME">상품명</option>
						<option value="G_CONTENT">내용</option>
					</select>
					<input type="text" class="inputBox" name="searchValue" placeholder="검색할 단어를 입력하세요" style="width: 300px;">
					<button type="button" class="btn" style="width: 100px;" onclick="sendIt();">검색</button>
				</form>
			</div>
		</div>
	</div>

	<!-- 중단 sidebar, container -->
	<div class="container-fluid" style="background-color: #F2F1F0;">
		<div class="container-fluid col-sm-8">
			<div class="row">
				<div class="container-fluid" style="width: 120%;">
					<img alt="" src="/icade/resources/data/img/best.png" style="width: 100%;">
					<br>
					<br>
					<br>
					<c:set var="i" value="0" />
					<c:forEach var="g_dto" items="${popularList}">

						<c:if test="${i % 2 == 0}">
							<div class="row">
						</c:if>

						<div class="col-sm-6" style="padding: 4px;">
							<div class="panel panel-primary">
								<div class="panel-heading">${g_dto.getG_NAME()}</div>
								<div class="panel-body">
									<a href="#"> <img src="<%=cp%>/resources/goodsImage/${g_dto.getG_SAVEFILENAME()}" style="height: 300px; width: 100%" alt="Image">
									</a>
								</div>
								<div class="panel-footer">${g_dto.getG_CONTENT()}</div>
							</div>
						</div>

						<c:if test="${i % 2 == 1 || popularList.size() == i+1}">
				</div>
				</c:if>

				<c:set var="i" value="${i+1}" />

				</c:forEach>
				<br>
				<br>
			</div>

			<div class="row">
				<div class="container-fluid" style="width: 120%;">
					<font style="color: #8F949; font-size: 30px;">신상품</font>
					<br>
					<br>
					<c:set var="i" value="0" />
					<c:forEach var="g_dto" items="${newList}">

						<c:if test="${i % 4 == 0}">
							<div class="row">
						</c:if>

						<div class="col-sm-3 thumbnail" style="border-radius: 30px; padding: 6px;">
							<a href="#"> <img src="<%=cp%>/resources/goodsImage/${g_dto.getG_SAVEFILENAME()}" style="width: 100%; height: 380px; border-top-left-radius: 30px; border-top-right-radius: 30px;" alt="Image">
								<div class="caption">
									<p>${g_dto.getG_NAME()}</p>
								</div>
							</a>
						</div>
						<br>


						<c:if test="${i % 4 == 3 || newList.size() == i+1}">
				</div>
				</c:if>

				<c:set var="i" value="${i+1}" />

				</c:forEach>
			</div>
		</div>
	</div>
	</div>
	<br>
	<br>
	<br>
	<br>

	</div>


	<div class="container-fluid " style="width: 100%; height: 300px; background-color: white;">
		<div class="row">
			<div class="col-sm-3">전화번호</div>
			<div class="col-sm-3">INFO</div>
			<div class="col-sm-3">아무거나</div>
			<div class="col-sm-3">귀찮네</div>
		</div>
	</div>
</body>
</html>