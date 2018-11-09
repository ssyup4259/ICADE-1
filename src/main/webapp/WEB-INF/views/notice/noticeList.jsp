<%@page import="org.springframework.http.HttpRequest"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-grid.min.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-panel.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/icade.css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

<script src="<%=cp%>/resources/data/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>

<style type="text/css">
</style>
<script type="text/javascript">

function registerNotice(){
	
	var f = document.noticeForm;
	
	f.action = "<%=cp%>
	/notice/noticeRegister.action";
		f.submit();

	}
</script>

</head>
<body style="font-family: LeeHyunJi; text-align: center; padding-top: 60px">
	<jsp:include page="../include/header.jsp" flush="false" />
	<div class="container-fluid" style="background-color: #F2F1F0; padding-top: 50px; padding-bottom: 50px;">
		<div class="container" style="width: 800px;">
			<form name="noticeForm" method="post">
				<h1>공지사항</h1>
				<div style="text-align: left">
					<c:forEach var="n_dto" items="${n_lists }">
						<a href="<%=cp%>/notice/noticeDetail.action?BN_NUM=${n_dto.getBN_NUM()}" style="color: black;">${n_dto.getBN_NUM() }. ${n_dto.getBN_SUBJECT() }</a>
						<hr style="border: 1px solid #8F9493;">
						<br>
					</c:forEach>

				</div>
				<c:if test="${sessionScope.userInfo.getM_RANK() != 'admin'}">
					<input type="button" class="btnGreen" value="공지사항 등록" onclick="registerNotice();">
				</c:if>
			</form>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp" flush="false" />
</body>
</html>