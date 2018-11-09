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
function noticeUpdateOk(){
	var f = document.noticeRegister;
	f.action = "<%=cp%>/notice/noticeUpdateOk.action";		
	f.submit();
}
</script>
</head>
<body>

	<jsp:include page="../include/header.jsp" flush="false" />
	<div class="container-fluid" style="background-color: #F2F1F0; padding-top: 50px; padding-bottom: 50px;">
		<form action="" method="post" name="noticeRegister">
			<input type="hidden" value="${n_dto.getBN_NUM()}" name="BN_NUM">
			<input type="hidden" value="${n_dto.getBN_DATE()}" name="BN_DATE">
			<div class="container">
				<h1>공지사항 수정</h1>
				<div class="row">
					<div class="col-sm-3">제목</div>
					<div class="col-sm-9">
						<input type="text" class="inputBoxGray" name="BN_SUBJECT" value="${n_dto.getBN_SUBJECT()}">
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3">내용</div>
					<div class="col-sm-9">
						<textarea rows="30" cols="80" name="BN_CONTENT" class=textAreaGray>${n_dto.getBN_CONTENT()}</textarea>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3"></div>
				</div>
				<input type="button" class="btnGreen" value="수정" onclick="noticeUpdateOk();">
				<input type="button" class="btnGreen" value="취소" onclick="history.back();">
			</div>
		</form>
	</div>
	<jsp:include page="../include/footer.jsp" flush="false" />
	
</body>
</html>