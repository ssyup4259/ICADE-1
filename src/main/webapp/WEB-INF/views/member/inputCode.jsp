<%@page import="org.springframework.http.HttpRequest"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<html>
<head>
<title>이메일 인증코드</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-grid.min.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-panel.css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/icade.css">
<link rel="shortcut icon" href="<%=cp%>/resources/images/favicon.ico">

<script src="<%=cp%>/resources/data/js/bootstrap.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script>



$(document).ready(function(){
		swal("등록하신 이메일로 인증번호를 발송했습니다.");
	});


	function checkInputCode() {

		var f = document.joinCodeForm;
		
		var inputCode = $("#inputCode").val();
		var joinCode = ${sessionScope.joinCode};
		if ($("#inputCode").val().length == 0 ) {
			swal("인증번호를 입력하세요");
			f.inputCode.focus();
		}else if (inputCode != joinCode) {
			swal("입력하신 인증번호가 다릅니다.");
			f.inputCode.focus();
		}else if (inputCode == joinCode) {
			swal("인증완료");
			opener.document.joinForm.checkNum.value = document.joinCodeForm.CcheckNum.value;
			self.close();
		}
	}
	
	$(document).keyup(function(e) {
		var keyCode = e.keyCode;

		if (keyCode == 13) {
			checkInputCode();
		}
	});
	
</script>
</head>
<body>
	<div class="container-fluid" style="text-align: center">
		<br/>
		<br/>
		<h3>인증번호를 입력하세요</h3>
		<div class="container">
			<form method="post" name="joinCodeForm" >
				<input type="text" style="display: none;">
				<input type="text" name="inputCode" class="inputBoxGreen" id="inputCode" style="width: 100%; height: 40px; text-align: center; font-size: 16px;" />
				<br>
				<br>
				<input type="button" class="btnGreen" value="인증하기" onclick="checkInputCode();" />
				<input type="hidden" name="joinCode" value="${sessionScope.joinCode}">
				<input type="hidden" name="CcheckNum" value="1">
			</form>
		</div>
	</div>
</body>
</html>