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
<title>상품 리스트</title>

<script type="text/javascript">

	function sendIt(){
		
		var f = document.searchForm;
		
		f.action = "<%=cp%>/goods/goodsList.action";
		f.submit();
		
	}

</script>

</head>
<body>

<h3>상품 리스트</h3>

<form action="" name="searchForm" method="post">
	<input type="hidden" name="GK_KIND_NUM" value="${GK_KIND_NUM}"/>
	<select name="searchKey" class="selectField">
		<option value="G_NAME">상품명</option>
		<option value="G_CONTENT">내용</option>
	</select>
	<input type="text" name="searchValue" class="textField">
	<input type="button" value=" 검색 " class="btn2" onclick="sendIt();"/>
</form>

<c:set var="i" value="0"/>
<c:forEach var="g_dto" items="${g_lists}">
	<div style="float: left;">
		<a href="<%=cp%>/goods/goodsArticle.action?pageNum=${pageNum}&G_NUM=${g_dto.getG_NUM()}">
		<img src="<%=cp%>/resources/goodsImage/${g_dto.getG_SAVEFILENAME()}" width="300" height="300"/></a>
		<br/>
		${g_dto.getG_NAME()} <br/>
		남은 수량 : ${g_dto.getG_COUNT()}		
	</div>
	<c:if test="${i % 4 == 3 || g_lists.size() == i+1}"><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/></c:if>
	<c:set var="i" value="${i+1}"/>

</c:forEach>

<c:if test="${dataCount!=0 }">
	${pageIndexList }
</c:if>
<c:if test="${dataCount==0 }">
	등록된 상품이 없습니다.
</c:if>

</body>
</html>