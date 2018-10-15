<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="login_ok.action" method="post">

<table>
<tr>
	<td>
		<h2>회원로그인</h2>
	</td>
</tr>
</table>

<table border="1">
<tr >
	<td >
		아이디 : <input type="text" name="M_ID">
		비밀번호 : <input type="password" name="M_PW">
	</td>
	<td rowspan="2">
		<input type="submit" value="로그인">
	</td>
</tr>
<tr>
	<td>
		<input type="checkbox" name="idSaveCheck">아이디 저장
	</td>
</tr>

</table>

<a href="join.action">회원가입</a>

</form>
<br/>
${msg }
<br/>
<br/>
<form action="loginTest.action" method="post">
<input type="submit" value="테스트로가기">
</form>

</body>
</html>