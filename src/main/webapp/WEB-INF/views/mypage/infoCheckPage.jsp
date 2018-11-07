<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
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
<title>회원정보 수정 본인 인증</title>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">

	function infoCheckPage_sendIt() {
		
		var pw = $("#pw").val();
		
		if(pw==""){
			alert("비밀번호를 입력해주세요.");
			return;
		}
		
		var msg = $("#msg").val();
		var f = document.myForm;

		if (msg) {
			alert(msg);
		} else {
			f.action = "infoCheckPage_ok.action";
			f.submit();
		}

	}
</script>
</head>
<body>
	<jsp:include page="../include/header.jsp" flush="false" />
	<div class="container-fluid" style="background-color: #F2F1F0; padding-top: 50px; padding-bottom: 50px;">
		<div class="container text-center" style="width: 500px;">
			<h1>회원정보 수정</h1>
			<div style="text-align: left">
				<b>회원정보를 수정하기 위해서는 비밀번호를 입력하셔야 합니다.</b>
				<br>
				-회원님의 아이디를 확인해 주세요.
				<br>
				-회원님의 비밀번호를 확인합니다.
				<br>
				-비밀번호 입력후 본인 인증을 눌려주세요.
				<br>
				-취소를 누르면 이전 페이지로 돌아갑니다.
				<br>
			</div>
			<hr style="border: 1px solid black">

			<div style="margin-top: 30px;">
				<form action="" method="post" name="myForm">

					<input type="hidden" id="mode" name="mode" value="${mode}">
					<input type="hidden" id="msg" name="msg" value="${msg}">
					<input type="text" style="display: none;">
					<table style="border: none;">
						<tr>
							<td colspan="2" style="text-align: left">아 이 디 : ${sessionScope.userInfo.getM_ID()}</td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: left">비밀번호 : <input type="password" name="M_PW" id="pw" class="inputBoxGray" style="width: 450px; background: transparent;"></td>
						</tr>
						<tr>
							<td style="border-right: 1;"><input type="button" value="본인인증" onclick="infoCheckPage_sendIt();" class="btnGreen" style="width: 100px;"></td>
							<td><input type="button" value="취소" onclick="location.href='myPage.action';" class="btnGreen" style="width: 100px;"></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp" flush="false" />

<script type="text/javascript">
//keyup 이벤트시에 입력마다 서버로 값을 보내서 포커스에서 벗어날시 작동하는 스크립트로 변경
		
	$("#pw").blur(function(event) {
		var pw = $("#pw").val();

		$.ajax({
			type : "POST",
			url : "pwCheckAjax.action",
			data : {"pw" : pw},
			dataType : "json",
			error : function(error) {
				alert(error);
			},
			success : function(data) {
				if (data == false) {
					//alert("false : " + data);
					$("#msg").val("비밀번호가 틀립니다.");
				} else if (data == true) {
					$("#msg").val("");
				}
			}
		});
	});
	
</script>
</body>
</html>