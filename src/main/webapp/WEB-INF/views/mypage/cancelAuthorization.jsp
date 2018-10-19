<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴시 본인 인증</title>
</head>
<body>
<form action="cancelCheckStep1.action" name="cancelCheck" method="post">



<table border="1" style="margin-left: auto; margin-right: auto;">
	<tr >
		<td >
			아이디 : ${sessionScope.userInfo.getM_ID()}
			비밀번호 : <input type="password" name="M_PW">
		</td>
		<td rowspan="2">
			<input type="submit" value="본인인증">
		</td>
	</tr>
	<tr>
		<td align="center">
			${msg }
		</td>
	</tr>
</table>
<br/>

<br/>

</form>


</body>
</html>