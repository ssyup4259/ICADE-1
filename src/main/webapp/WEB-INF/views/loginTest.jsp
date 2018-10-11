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
<%-- 
<c:if test=" ${empty sessionScope.userId}">
	비어있을때 보인다
</c:if>

<c:if test=" ${not empty sessionScope.userId}">
	세션이 있을때
</c:if> --%>

<c:choose>
	<c:when test="${empty sessionScope.userId}">
		<a href="login.action"><input type="button" value="로그인"></a>
		<a href="join.action"><input type="button" value="회원가입"></a>
	</c:when>
	<c:otherwise>
		<h5> ${sessionScope.userId} 님 로그인 되었습니다. </h1>
		<a href="logout.action"><input type="button" value="로그아웃"></a>
	</c:otherwise>
</c:choose>

<br/>
기본값으로 보이는곳



</body>
</html>