<%@page import="org.springframework.http.HttpRequest"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

	function searchIt(){
		
		var f = document.goodsSearchForm;
		
		f.action = "<%=cp%>/goods/goodsList.action";
		f.submit();

	}
	
</script>

<style type="text/css">
#goodsImage {
	width: 85%;
	height: 40%;
	margin-top: 15px;;
	border-top-left-radius: 30px;
	border-top-right-radius: 30px;
}

.carousel {
	position: relative;
	overflow: hidden;
	height: 500px;
}

.carousel>li {
	position: absolute;
	left: 0;
	top: 0;
	opacity: 1;
	animation: slide 16s ease infinite forwards;
}

.carousel>li:nth-child(1) {
	opacity: 1;
	z-index: 3;
}

.carousel>li:nth-child(2) {
	z-index: 2;
	animation-delay: 4s;
}

.carousel>li:nth-child(3) {
	z-index: 1;
	animation-delay: 8s;
}

@keyframes slide{
    0%{opacity:1; left:0;}
    33.33%{opacity:0.5; left:-120%;}
    34%{opacity:0;}
    66.66%{left:0; opacity:0;}
    100%{opacity:1;}
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
		<div class="" id="myNavbar">
			<div align="center" style="margin-top: 25px;">
				<form action="" name="goodsSearchForm" method="post">
					<input type="hidden" name="GK_KIND_NUM" value="${gdKindNum}" />

					<select name="GK_KIND_NUM" class="selGreen" style="width: 100px; cursor: pointer;">
						<option value="">전체</option>
						<c:forEach var="gk_dto" items="${gk_lists}">
							<option value="${gk_dto.getGK_NUM()}">${gk_dto.getGK_KIND()}</option>
						</c:forEach>
					</select>

					<select name="searchKey" class="selGreen" style="width: 100px; cursor: pointer;">
						<option value="G_NAME">상품명</option>
						<option value="G_CONTENT">내용</option>
					</select>
					<input type="text" class="inputBoxGray" name="searchValue" placeholder="검색할 단어를 입력하세요" style="width: 300px;" onkeypress="if(event.keyCode==13) searchIt();">
					<div style="display: none;"><input type="text" value=""/></div>
					<button type="button" class="btnGreen" style="width: 100px;" onclick="searchIt();">검색</button>
				</form>
			</div>
		</div>
	</div>

	<!-- 중단 sidebar, container -->
	<div class="container-fluid" style="background-color: #F2F1F0; padding-top: 50px; padding-bottom: 50px;">
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
								<div class="panel-footer" style="text-align: right;">
									가격 :
									<fmt:formatNumber>${g_dto.getG_PRICE()}</fmt:formatNumber>
									원
								</div>
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
							<a href="<%=cp%>/goods/goodsArticle.action?G_NUM=${g_dto.getG_NUM()}"> <img src="<%=cp%>/resources/goodsImage/${g_dto.getG_SAVEFILENAME()}" id="goodsImage">
								<div style="padding-left: 10%">
									<p>${g_dto.getG_NAME()}</p>
								</div>
								<div class="row">
									<div class="col-sm-6" style="text-align: left; padding-left: 10%;">가격 :</div>
									<div class="col-sm-6" style="text-align: right; padding-right: 10%;">
										<fmt:formatNumber>${g_dto.getG_PRICE()}</fmt:formatNumber>
										원
									</div>
								</div>
							</a>
						</div>
					

						<c:if test="${i % 4 == 3 || newList.size() == i+1}">
				</div>
					<br><br>
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