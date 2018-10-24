<%@page import="org.springframework.http.HttpRequest"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<html>
<head>
<title>ICADE</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/icade.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-grid.min.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-panel.css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

<script src="<%=cp%>/resources/data/js/bootstrap.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>

<script type="text/javascript">

	function sendIt(){
		
		var f = document.searchForm;
		
		f.action = "<%=cp%>
	/goods/goodsList.action";
		f.submit();

	}
</script>
<script type="text/javascript">
	jQuery(document).ready(function() {
		var offset = 220;
		var duration = 500;
		jQuery(window).scroll(function() {
			if (jQuery(this).scrollTop() > offset) {
				jQuery('.back_to_top').fadeIn(duration);
			} else {
				jQuery('.back_to_top').fadeOut(duration);
			}
		});

		jQuery('.back_to_top').click(function(event) {
			event.preventDefault();
			jQuery('html, body').animate({
				scrollTop : 0
			}, duration);
			return false;
		})
	});
</script>
<style type="text/css">
.back_to_top {
	position: fixed;
	bottom: 10px;
	left: 90%;
	text-decoration: none;
	padding: auto;
	display: none;
	z-index: 998;
}

a:link {
	color: #8F9493;
	text-decoration: none;
}

a:visited {
	color: #8F9493;
	text-decoration: none;
}

a:hover {
	color: #A3C838;
}

a:active {
	color: #A3C838;
}

a.footer {
	color: black;
}

#opacity {
	opacity: 0.8;
}

#opacity:hover {
	opacity: 1.0;
}
</style>
</head>
<body>
	<div class="container-fluid text-center event" style="background-color: #DDDADB; font-size: 26px; vertical-align: middle;">
		GRAND OPEN!! 회원가입 시 2000포인트 증정!
		<img src="/icade/resources/data/img/close.png" onclick="$('.event').slideUp(400);" style="cursor: pointer; vertical-align: top; size: 26px;">
	</div>

	<jsp:include page="./include/header.jsp" flush="false" />

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
					<input type="hidden" name="GK_KIND_NUM" value="${gkKindNum}" />

					<select name="GK_KIND_NUM" class="sel" style="width: 100px; cursor: pointer;">
						<option value="">전체</option>
						<c:forEach var="gk_dto" items="${gk_lists}">
							<option value="${gk_dto.getGK_NUM()}">${gk_dto.getGK_KIND()}</option>
						</c:forEach>
					</select>

					<select name="searchKey" class="sel" style="width: 100px; cursor: pointer;">
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
	<div class="container-fluid" style="background-color: #F2F1F0; padding-top: 50px;">
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
									<a href="<%=cp%>/goods/goodsArticle.action?G_NUM=${g_dto.getG_NUM()}"> <img id="opacity" src="<%=cp%>/resources/goodsImage/${g_dto.getG_SAVEFILENAME()}" style="height: 300px; width: 100%" alt="Image">
									</a>
								</div>
								<div class="panel-footer" style="text-align: right;">가격 : ${g_dto.getG_PRICE()}원</div>
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

						<div class="col-sm-3 thumbnail" style="border-radius: 30px; padding: 6px; margin: 0px;">
							<a href="<%=cp%>/goods/goodsArticle.action?G_NUM=${g_dto.getG_NUM()}"> <img src="<%=cp%>/resources/goodsImage/${g_dto.getG_SAVEFILENAME()}" style="width: 85%; height: 40%; margin-top: 15px;; border-top-left-radius: 30px; border-top-right-radius: 30px;" alt="Image">
								<div style="padding-left: 10%">
									<p>${g_dto.getG_NAME()}</p>
								</div>
								<div class="row">
									<div class="col-sm-6" style="text-align: left; padding-left: 10%;">가격 :</div>
									<div class="col-sm-6" style="text-align: right; padding-right: 10%;">${g_dto.getG_PRICE()}원</div>
								</div>
							</a>
						</div>

						<c:if test="${i % 4 == 3 || newList.size() == i+1}">
				</div>
				<br>
				<br>
				</c:if>

				<c:set var="i" value="${i+1}" />

				</c:forEach>
			</div>
		</div>
	</div>
	</div>

	</div>
	<jsp:include page="./include/footer.jsp" flush="false" />

</body>
</html>