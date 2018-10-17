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
<title>장바구니</title>
</head>
<body>

<h3>장바구니 리스트</h3>
<c:forEach var="c_dto" items="${c_lists}">
	<img src="<%=cp%>/resources/goodsImage/${c_dto.getC_SAVEFILENAME()}" width="100" height="100" align="middle"/>&nbsp;
	${c_dto.getC_NAME()}&nbsp;
	[${c_dto.getC_DEVICE()} / ${c_dto.getC_COLOR()}]&nbsp;&nbsp;&nbsp;
	${c_dto.getC_PRICE()}원&nbsp;&nbsp;&nbsp;${c_dto.getC_COUNT()}개&nbsp;
	${c_dto.getC_PRICE() * c_dto.getC_COUNT()}원&nbsp;&nbsp;
	<a href="<%=cp%>/cart/deleteCartItem.action?c_num=${c_dto.getC_NUM()}&pageNum=${pageNum}">삭제</a>
	<br/><br/>
</c:forEach>

<c:if test="${dataCount!=0 }">
	<br/>
	<input type="button" value="모두 비우기" onclick="javascript:location.href='<%=cp%>/cart/deleteCartAll.action';"/>
	<br/><br/>
</c:if>
<c:if test="${dataCount!=0 }">
	${pageIndexList }
</c:if>
<c:if test="${dataCount==0 }">
	등록된 상품이 없습니다.
</c:if>


</body>
</html>