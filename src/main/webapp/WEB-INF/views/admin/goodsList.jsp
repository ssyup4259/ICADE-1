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
<title>상품목록</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/icade.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-grid.min.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-panel.css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

<script src="<%=cp%>/resources/data/js/bootstrap.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
function goodsSearchIt() {
	
	var f = document.gSearchForm;
	        
	f.action = "<%=cp%>/admin/goodsList.action";
	f.submit();

}
</script>
<style type="text/css">
.paging a{
	color: black;
}

.paging a:active{
	color:#A3C838;
}
</style>

</head>
<body>
	<jsp:include page="../include/header.jsp" flush="false" />
	<div class="container-fluid" style="background-color: #F2F1F0; padding-top: 50px; padding-bottom: 50px;">

		<div class="container-fluid text-center">
			<h1>상품 목록</h1>
			<form action="" name="gSearchForm" method="post">
				<select name="GD_KIND_NUM" class="selGreen" style="width: 150px;">
					<option value="">전체</option>
					<c:forEach var="gk_dto" items="${gk_lists}">
						<c:if test="${gdKindNum eq gk_dto.GK_NUM}">
							<option value="${gk_dto.GK_NUM}" selected="selected">${gk_dto.GK_KIND}</option>
						</c:if>
						<c:if test="${gdKindNum ne gk_dto.GK_NUM}">
							<option value="${gk_dto.GK_NUM}">${gk_dto.GK_KIND}</option>
						</c:if>
					</c:forEach>
				</select>

				<select name="searchKey" class="selGreen" style="width: 150px;">
					<option value="G_NAME">상품명</option>
					<option value="G_CONTENT">내용</option>
				</select>

				<input type="text" name="searchValue" class="inputBoxGray" style="width: 400px;" placeholder="검색한 단어를 입력해주세요.">
				<input type="button" value=" 검색 " class="btnGreen" onclick="goodsSearchIt();" style="width: 150px;" />

				<input type="button" value=" 상품 등록 " class="btnGreen" onclick="javascript:location.href='<%=cp%>/admin/insertGoods.action';" style="width: 150px;" />

			</form>

			<table cellpadding="10" cellspacing="0" style="width: 80%; margin: auto;">
				<thead style="border: none;">
					<tr>
						<th>상품 종류</th>
						<th>상품 이름</th>
						<th>상품 개수</th>
						<th>상품 가격</th>
						<th>판매 개수</th>
						<th>상품 내용</th>
						<th>할인율</th>
						<th>섬네일</th>
						<th>수정/삭제</th>
					</tr>
				</thead>
				<tbody style="border: none;">
					<c:forEach var="g_dto" items="${g_lists}">
						<tr>
							<td>${g_dto.getGK_KIND()}</td>
							<td><a href="<%=cp%>/goods/goodsArticle.action?G_NUM=${g_dto.getG_NUM()}">${g_dto.getG_NAME()}</a></td>
							<td><a href="<%=cp%>/admin/updateGoodsDetailCount.action?g_num=${g_dto.getG_NUM()}"><fmt:formatNumber>${g_dto.getG_COUNT()}</fmt:formatNumber>개</a></td>
							<td><fmt:formatNumber>${g_dto.getG_PRICE()}</fmt:formatNumber>원</td>
							<td><fmt:formatNumber>${g_dto.getG_SELLCOUNT()}</fmt:formatNumber>개</td>
							<td>${g_dto.getG_CONTENT()}</td>
							<td>${g_dto.getG_DISCOUNT()}%</td>
							<td><img src="<%=cp%>/resources/goodsImage/${g_dto.getG_SAVEFILENAME()}" width="100" height="100" /></td>
							<td><a style="cursor: pointer;" onclick="window.open('updateGoods.action?g_num=${g_dto.getG_NUM()}', '상품 수정', 'width=400, height=900')">수정</a> / <a href="<%=cp%>/admin/deleteGoods.action?g_num=${g_dto.getG_NUM()}">삭제</a></td>
							<!-- <a href="<%=cp%>/admin/updateGoods.action?g_num=${g_dto.getG_NUM()}">수정</a> -->
						</tr>
					</c:forEach>
					<tr>
						<td colspan="9">
						<div class="paging">
						<c:if test="${dataCount!=0 }">
				${pageIndexList }
					</c:if> <c:if test="${dataCount==0 }">
				등록된 상품이 없습니다.
					</c:if>
						</div>
					
					</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp" flush="false" />


</body>
</html>