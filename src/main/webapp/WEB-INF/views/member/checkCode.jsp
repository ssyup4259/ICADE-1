<%@ page contentType="text/html; charset=UTF-8"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script>
function check() {
	
	var form = document.authenform;
	var authNum =${authNum};
	
	if (!form.authnum.value) {
		
		alert("인증번호를 입력하세요");
		return false;
	}
	if (form.authnum.value!=authnum) {
		alert("틀린 인증번호 입니다. 인증번호를 다시 입력해주세요");
		form.authnum.value="";
		return false;
	}
	if (form.authnum.value == authnum) {
		alert("인증완료");
		opener.document.userinput.mailCheck.value="인증완료";
		self.close();
	}
	
}


</script>
</head>
<body>
<center>
<h5>인증 번호 7자리를 입력하세요</h5>
 <div class="container">
  	<form method="post" name="authenform" onsubmit="return check()">
  		<input type="text" name="authnum"><br><br>
  		<input type="submit" class="btn btn-info" value="submit">
  	</form>
 </div>
 </center>
</body>
</html>