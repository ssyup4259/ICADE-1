<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:choose>
	<c:when test="${empty sessionScope.userInfo.getM_ID()}">
		<a href="login.action"><input type="button" value="로그인"></a>
		<a href="join.action"><input type="button" value="회원가입"></a>
		<a href="<%=cp%>"><input type="button" value="메인페이지"></a>
	</c:when>
	<c:otherwise>
		<h5> ${sessionScope.userInfo.getM_NAME()} 님 로그인 되었습니다. </h5>
		<a href="logout.action"><input type="button" value="로그아웃"></a>
		<a href="<%=cp%>"><input type="button" value="메인페이지"></a>
		<a href="myPage.action"><input type="button" value="마이페이지"></a>
	</c:otherwise>
</c:choose>

<br/>
기본값으로 보이는곳
<a href="test.action"><input type="button" value="가라"></a>




</body>
</html>