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
<title>상품 재고 수정</title>
</head>
<body>

<h3>상품 재고 수정</h3>
<h1>${g_name}</h1>
<form action="" method="post" name="myForm">

	<c:set var="i" value="plz"/>
	
	<c:forEach var="gd_dto" items="${gd_lists}">
	
		<c:if test="${i ne gd_dto.DK_NAME}">
			<br/><br/>${gd_dto.DK_NAME}<br/>
		</c:if>
		
		<c:if test="${i eq gd_dto.DK_NAME}">
			<br/>
		</c:if>
		
		<c:set var="i" value="${gd_dto.DK_NAME}"/>
		
		${gd_dto.GC_COLOR} : <input type="text" name="${gd_dto.GD_CODE}" value="${gd_dto.GD_COUNT}" size="3"/>개&nbsp;
		
	</c:forEach>
	
	<input type="button" onclick="sendIt()" value="재고 수정"/>
	<input type="button" onclick="javascript:history.back();" value="취 소"/>

</form>

</body>
</html>