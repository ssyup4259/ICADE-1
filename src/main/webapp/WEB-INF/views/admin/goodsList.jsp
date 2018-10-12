<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 목록</title>
<script type="text/javascript">

	function sendIt(){
		
		var f = document.searchForm;
		
		f.action = "<%=cp%>/admin/goodsList.action";
		f.submit();
		
	}


</script>

</head>
<body>

<div id="bbsList">

<h3>상품 목록</h3>
	
<div id="bbsList_header">
	<div id="leftHeader">
		<form action="" name="searchForm" method="post">
			<select name="searchKey" class="selectField">
				<option value="G_NAME">상품명</option>
				<option value="G_CONTENT">내용</option>
			</select>
			<input type="text" name="searchValue" class="textField">
			<input type="button" value=" 검색 " class="btn2" onclick="sendIt();"/>			
		</form>		
	</div>
	
	<div id="rightHeader">
		<input type="button" value=" 상품 등록 " class="btn2" 
		onclick="javascript:location.href='<%=cp%>/admin/insertGoods.action';"/>		
	</div>	
</div>

<table style="text-align: center;" border="1" cellpadding="0" cellspacing="0">
	<tr>
		<td>상품 번호</td>
		<td>상품 이름</td>
		<td>상품 개수</td>
		<td>상품 가격</td>
		<td>판매 개수</td>
		<td>상품 내용</td>
		<td>할인율</td>
		<td>원본 파일명</td>
		<td>저장 파일명</td>
	</tr>
	
	<c:forEach var="g_dto" items="${g_lists}">
		<tr>
			<td>${g_dto.getG_NUM()}</td>
			<td>${g_dto.getG_NAME()}</td>
			<td>${g_dto.getG_COUNT()}</td>
			<td>${g_dto.getG_PRICE()}</td>
			<td>${g_dto.getG_SELLCOUNT()}</td>
			<td>${g_dto.getG_CONTENT()}</td>
			<td>${g_dto.getG_DISCOUNT()}</td>
			<td>${g_dto.getG_PHOTO()}</td>
			<td>${g_dto.getG_SAVEFILENAME()}</td>
		</tr>
	</c:forEach>
	
	<tr>
		<td colspan="9">
			<c:if test="${dataCount!=0 }">
				${pageIndexList }
			</c:if>
			<c:if test="${dataCount==0 }">
				등록된게시물이 없습니다.
			</c:if>
		</td>
	</tr>

</table>	
		
</div>

</body>
</html>