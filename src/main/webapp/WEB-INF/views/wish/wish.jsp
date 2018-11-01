<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table style="text-align: center;" border="1" cellpadding="10" cellspacing="0">
	
	
	<c:forEach var="w_dto" items="${wishList}">
		<tr>
			
			<td><img src="<%=cp%>/resources/goodsImage/${w_dto.getW_SAVEFILENAME()}" width="100" height="100"/></td>
			
		</tr>
	</c:forEach>
	<tr>
		<td colspan="9">
			<c:if test="${dataCount!=0 }">
				${pageIndexList }
			</c:if>
			<c:if test="${dataCount==0 }">
				등록된 상품이 없습니다.
			</c:if>
		</td>
	</tr>
	
	

</table>
	
</body>
</html>