<%@ page contentType="text/html; charset=UTF-8"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>

<script type="text/javascript">
 function check() {
	 var form = document.joinCodeForm;
	 code1 = f.joinCode.value;
	 code2 = f.inputCode.value;
		
		
		alert(code1);
		alert(code2);
		
		if (code1 != "" || code2 != "") {
			if (code1 == code2) {
				alert("인증에 성공했습니다.")
			}else{
				alert("인증에 실패했습니다.")
			}
		}
}
</script>
</head>
<body>
	<center>
		<br/><br/>
		<h5>인증번호 6 자리를 입력하세요</h5>
		<div class="container">
			<form method="post" name="joinCodeForm" onsubmit="return check();">
				<input type="text" name="inputCode"/><br><br>
				<input type="submit" value="Submit"/>
				<input type="hidden" name="joinCode" value="${sessionScope.joinCode}">
			</form>
		
		</div>
			
	
	</center>

</body>
</html>