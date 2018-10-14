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
<title>관리자 화면</title>
</head>
<body>

<h3>관리자 화면</h3>

<a href="<%=cp%>/admin/goodsList.action">상품 목록</a>
<a href="<%=cp%>/admin/memberList.action">회원 목록</a>
<a href=""></a>

</body>
</html>