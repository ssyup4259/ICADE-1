<%@page import="org.springframework.http.HttpRequest"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/icade.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-grid.min.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-panel.css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

<script src="<%=cp%>/resources/data/js/bootstrap.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<title>회원탈퇴시 본인 인증</title>
</head>
<body>

	<jsp:include page="../include/header.jsp" flush="false" />
	<form action="cancelCheckStep1.action" name="cancelCheck" method="post">



		<table border="1" style="margin-left: auto; margin-right: auto;">
			<tr>
				<td>아이디 : ${sessionScope.userInfo.getM_ID()} 비밀번호 : <input type="password" name="M_PW">
				</td>
				<td rowspan="2"><input type="submit" value="본인인증"></td>
			</tr>
			<tr>
				<td align="center">${msg }</td>
			</tr>
		</table>
		<br />

		<br />

	</form>

	<jsp:include page="../include/footer.jsp" flush="false" />
</body>
</html>