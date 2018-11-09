<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
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
<link rel="stylesheet" href="<%=cp%>/resources/data/css/icade.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-grid.min.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-panel.css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

<script src="<%=cp%>/resources/data/js/bootstrap.min.js"></script>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"></script><!-- 네이버 로그인 용 안쓸꺼면 삭제예정 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="<%=cp%>/resources/data/js/loginScript.js"></script>
<script type="text/javascript">
	$(document).keyup(function(e) {
		var keyCode = e.keyCode;

		if (keyCode == 13) {
			loginProcess();
		}
	});
</script>
</head>
<body>

	<jsp:include page="../include/header.jsp" flush="false" />

	<form action="login_ok.action" method="post" id="loginForm">
		<div class="container-fluid" style="background-color: #F2F1F0; padding-top: 50px; padding-bottom: 50px;">
			<div class="container text-center" style="width: 500px;">
				<h1>회원 로그인</h1>
				<div style="text-align: left">
					<b>아이케이드의 혜택을 받기 위해서는 로그인을 하여야합니다.</b>
					<br>
					-회원님의 아이디를 입력해 주세요.
					<br>
					-회원이 아니라면 회원가입을 눌려 주세요.
					<br>
					-정보를 잊었다면 아이디 찾기/비밀번호 찾기를 이용해 주세요.
					<br>
				</div>
				<hr style="border: 1px solid black">
					<font style="color: red;">${msg }</font>
				<div style="margin-top: 30px;">
					<table style="border: none;">
						<tr>
							<td colspan="2" style="text-align: left">아 이 디 : <input type="text" name="M_ID" id="userId" autofocus class="inputBoxGray" style="width: 380px; background: transparent"></td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: left">비밀번호 : <input type="password" name="M_PW" id="userPw" class="inputBoxGray" style="width: 380px; background: transparent"></td>
						</tr>
						<tr style="border-bottom: 1px solid black;">
							<td style="border-right: 1;"><input type="checkbox" id="saveId" name="idSaveCheck">아이디 저장</td>
							<td><input type="button" value="로그인" id="login" onClick="loginProcess()" class="btnGreen" style="width: 150px;"></td>
							<!-- 
							<td>
								<div id="naverIdLogin" align="center">
									<a id="naver-login-btn" href="#" role="button">
										<img src="https://static.nid.naver.com/oauth/big_g.PNG" width="80%" height="45"/> 
									</a>
								</div>
							</td> 
							-->
						</tr>
					</table>
				</div>

			
				<br />
				<a href="<%=cp%>/find/idFind.action">아이디 찾기</a>&nbsp;/&nbsp;
				<a href="<%=cp%>/find/pwdFind.action">비밀번호 찾기</a>&nbsp;/&nbsp;
				<a href="<%=cp%>/member/join.action">회원가입</a>

			</div>
		</div>
	</form>

<jsp:include page="../include/footer.jsp" flush="false" />
</body>
</html>