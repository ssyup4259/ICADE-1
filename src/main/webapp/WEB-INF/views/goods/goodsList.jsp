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
<script type="text/javascript">

	function sendIt(){
		
		var f = document.searchForm;
		
		f.action = "<%=cp%>/goods/goodsList.action";
		f.submit();
		
	}

</script>

</head>
<body>

<jsp:include page="../include/header.jsp" flush="false"/>

	<div class="container-fluid sticky2" style="width: 700px; z-index: 999;">
		<div class="collapse navbar-collapse" id="myNavbar">
			<div align="center" style="margin-top: 25px;">
				<form class="form-inline" action="" name="searchForm" method="post">
					<input type="hidden" name="GK_KIND_NUM" value="${gdKindNum}" />
					
					<select name="GK_KIND_NUM" class="sel1" style="width: 100px;">
						<option value="">전체</option>
						<c:forEach var="gk_dto" items="${gk_lists}">
							<option value="${gk_dto.getGK_NUM()}">${gk_dto.getGK_KIND()}</option>
						</c:forEach>
					</select>
					
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

	<div class="container-fluid" style="background-color: #F2F1F0;">
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

						<div class="col-sm-3 thumbnail" style="border-radius: 30px; padding: 6px;">
							<a href="#"> <img src="<%=cp%>/resources/goodsImage/${g_dto.getG_SAVEFILENAME()}" style="width: 100%; height: 380px; border-top-left-radius: 30px; border-top-right-radius: 30px;" alt="Image">
								<div class="caption">
									<p>${g_dto.getG_NAME()}</p>
									남은 수량 : ${g_dto.getG_COUNT()}
								</div>
							</a>
						</div>
						
						<br>

						<c:if test="${i % 4 == 3 || g_lists.size() == i+1}">
							</div>
						</c:if>
		
						<c:set var="i" value="${i+1}" />

					</c:forEach>
					<div style="text-align: center;">
						<c:if test="${dataCount!=0 }">
							${pageIndexList }
						</c:if>
						
						<c:if test="${dataCount==0 }">
							등록된 상품이 없습니다.
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<br><br><br><br>

</body>
</html>