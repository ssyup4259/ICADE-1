<%@ page contentType="text/html; charset=UTF-8"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>

<script type="text/javascript">

	function check() {
		
		var f = document.joinCodeForm;
		var joinCode = ${sessionScope.joinCode};
		
		if (!f.inputCode.value) {
			alert("인증번호를 입력하세요");
			return false;
		}
		
		if (!f.inputCode.value != joinCode) {
			alert("입력하신 인증번호가 다릅니다.")
			return false;	
		}
		if (!f.inputCode.value == joinCode) {
			alert("인증완료");
			
			self.close();
		}
		
	}

</script>
</head>
<body>
	<center>
		<br/><br/>
		<h5>인증번호 6 자리를 입력하세요</h5>
		<div class="container">
			<form method="post" name="joinCodeForm" onclick="check();">
				<input type="text" name="inputCode"/><br><br>
				<input type="submit" value="인증하기"/>
				<input type="text" name="joinCode" value="${sessionScope.joinCode}">
			</form>
		</div>
	</center>
</body>
</html>