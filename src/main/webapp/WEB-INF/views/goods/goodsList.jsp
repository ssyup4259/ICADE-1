<%@page import="org.springframework.http.HttpRequest"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" contentType="text/html; charset=UTF-8"%>
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
<link rel="stylesheet" href="<%=cp%>/resources/data/css/icade.css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

<script src="<%=cp%>/resources/data/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>

<style type="text/css">
</style>
<script type="text/javascript">

	function searchIt(){
		
		var f = document.goodsSearchForm;
		
		f.action = "<%=cp%>/goods/goodsList.action";
		f.submit();

	}
</script>
</head>
<body>

	<jsp:include page="../include/header.jsp" flush="false" />

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
					</select>
					<input type="text" class="inputBoxGray" name="searchValue" placeholder="검색할 단어를 입력하세요" style="width: 300px;">
					<button type="button" class="btnGreen" style="width: 100px;" onclick="searchIt();">검색</button>
				</form>
			</div>
		</div>
	</div>

	<div class="container-fluid" style="background-color: #F2F1F0; padding-top: 50px;">
		<div class="container-fluid col-sm-8">
			<div class="row">
				<div class="container-fluid" style="width: 120%;">
					<c:forEach var="gk_dto" items="${gk_lists}">
						<c:if test="${gdKindNum == gk_dto.getGK_NUM()}">
							<font style="color: #8F949; font-size: 30px;">${gk_dto.getGK_KIND()}</font>
						</c:if>
					</c:forEach>
					<c:if test="${empty gdKindNum}">
						<font style="color: #8F949; font-size: 30px;">전체</font>
					</c:if>
					<br>
					<br>
					<c:set var="i" value="0" />
					<c:forEach var="g_dto" items="${g_lists}">
						<c:if test="${i % 4 == 0}">
							<div class="row">
						</c:if>

						<div class="col-sm-3 thumbnail" style="border-radius: 30px; padding: 6px; margin: 0px;">
							<a href="<%=cp%>/goods/goodsArticle.action?G_NUM=${g_dto.getG_NUM()}&GK_KIND_NUM=${gdKindNum}">
							<img src="<%=cp%>/resources/goodsImage/${g_dto.getG_SAVEFILENAME()}" id="goodsImage">
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

						<br>

						<c:if test="${i % 4 == 3 || g_lists.size() == i+1}">
				</div>
				<br>
				<br>
				</c:if>

				<c:set var="i" value="${i+1}" />

				</c:forEach>
				<div style="text-align: center;">
					<c:if test="${dataCount != 0 }">
							${pageIndexList}
						</c:if>

					<c:if test="${dataCount == 0 }">
							등록된 상품이 없습니다.
						</c:if>
				</div>
			</div>
		</div>
	</div>
	
	<br>
	<br>
	<jsp:include page="../include/footer.jsp" flush="false" />
</body>
</html>