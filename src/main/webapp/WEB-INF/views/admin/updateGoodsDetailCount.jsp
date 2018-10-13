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
<title>Insert title here</title>
</head>
<body>

<h3>상품 재고 수정</h3>

<c:forEach var="gd_dto" items="${gd_lists}">

	${gd_dto.DK_NAME} <br/>
		
	${gd_dto.GC_COLOR} : <input type="text" name="GD_COUNT" value="${gd_dto.GD_COUNT}" size="3"/>개&nbsp;<br/>
	
</c:forEach>
 

</body>
</html>