<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/icadeStyle.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-grid.min.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-panel.css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

<script src="<%=cp%>/resources/data/js/bootstrap.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="<%=cp%>/resources/data/js/loginScript.js"></script>

</head>
<body>

<jsp:include page="../include/header.jsp" flush="false" />

<form action="login_ok.action" method="post" id="loginForm">
	
	<div style="text-align: center;">
	
		<table style="margin-left: auto; margin-right: auto;">
			<tr>
				<td>
					<h2>회원로그인</h2>
				</td>
			</tr>
		</table>
		
		<table border="1" style="margin-left: auto; margin-right: auto;">
			<tr>
				<td >
					아이디 : <input type="text" name="M_ID" id="userId">
					비밀번호 : <input type="password" name="M_PW" id="userPw">
				</td>
				<td rowspan="2">
					 <input type="button" value="로그인" onClick="loginProcess()">
				</td>
			</tr>
			
			<tr>
				<td>
					<input type="checkbox" id="saveId" name="idSaveCheck">아이디 저장
				</td>
			</tr>
		
		</table>
		
		<br/>
		<a href="<%=cp%>/search/idSearch.action">아이디 찾기</a>&nbsp;/&nbsp;
		<a href="<%=cp%>/search/pwdSearch.action">비밀번호 찾기</a>&nbsp;/&nbsp;
		<a href="<%=cp%>/join.action">회원가입</a>
	
	</div>
</form>
<br/>
${msg }
<br/>
<br/>

<jsp:include page="../include/footer.jsp" flush="false" />

</body>
</html>