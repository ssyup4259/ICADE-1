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
<title>체크박스 데이터가 넘어오는지</title>
</head>
<body>

<c:forEach var="c_dto" items="${c_lists}">
	<img src="<%=cp%>/resources/goodsImage/${c_dto.getC_SAVEFILENAME()}" width="100" height="100" align="middle"/><br/>
	C_CODE : ${c_dto.getC_CODE()}<br/>
	C_COUNT : ${c_dto.getC_COUNT()}<br/>
	<br/>
</c:forEach>

</body>
</html>