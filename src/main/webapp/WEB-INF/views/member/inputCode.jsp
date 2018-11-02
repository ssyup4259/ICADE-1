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
<link rel="stylesheet" href="<%=cp%>/resources/data/css/sangyeop.css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

<script src="<%=cp%>/resources/data/js/bootstrap.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<script type="text/javascript">
	function check() {

		var f = document.joinCodeForm;
		var joinCode = ${sessionScope.joinCode};

		if (!f.inputCode.value) {
			alert("인증번호를 입력하세요");
			return false;
		}

		if (f.inputCode.value != joinCode) {
			alert("입력하신 인증번호가 다릅니다.")
			return false;
		}
		if (f.inputCode.value == joinCode) {
			alert("인증완료");
			opener.document.joinForm.checkNum.value = document.joinCodeForm.CcheckNum.value;
			self.close();
		}

	}
</script>
</head>
<body>
	<div class="container-fluid text-center">
		<br />
		<br />
		<h3>인증번호를 입력하세요</h3>
		<div class="container">
			<form method="post" name="joinCodeForm" onclick="check();">
				<input type="text" name="inputCode" style="width: 100%; height: 40px; text-align: center; font-size: 16px;" />
				<br>
				<br>
				<input type="submit" class="btn" value="인증하기" />
				<input type="text" name="joinCode" value="${sessionScope.joinCode}">
				<input type="text" name="CcheckNum" value="1">
			</form>
		</div>
	</div>
</body>
</html>