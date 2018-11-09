<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Keywords" content="회원가입" />
<meta name="Description" content="회원가입" />
<title>아이폰 케이스는 ICADE</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-grid.min.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-panel.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/icade.css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

<script src="<%=cp%>/resources/data/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="<%=cp%>/resources/data/js/changInfoScript.js"></script>

<!-- daum api -->
<!--autoload=false 파라미터를 이용하여 자동으로 로딩되는 것을 막습니다.-->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script charset="UTF-8" type="text/javascript" src="http://t1.daumcdn.net/postcode/api/core/180928/1538455030985/180928.js"></script>
<style type="text/css">
</style>
</head>


<body>

	<input type="hidden" id="msg" value="">

	<jsp:include page="../include/header2.jsp" flush="false" />
	<!-- 내용 -->
	<form name="joinForm" action="" method="post" id="joinForm">
		<div class="container-fluid" style="background-color: #F2F1F0; padding-top: 50px; padding-bottom: 50px;">

			<div class="container text-center">
				<div class="titleArea row">
					<div class="col-sm-6" style="text-align: left;">
						<h2>회원 정보 수정</h2>
						<span style="font-size: 15px; font-weight: 300;">아이케이드의 다양한 회원혜택을 받으세요.</span>
					</div>
					<div class="col-sm-6" style="text-align: right;">

						<h3 class="">기본정보</h3>
						<p class="required ">
							<img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수">
							필수입력사항
						</p>
					</div>
				</div>
				<hr>
				<div class="col-sm-8" style="font-size: 16px;">
					<div class="row">
						<div class="col-sm-2">
							<p>아이디</p>
						</div>
						<div class="col-sm-10" style="text-align: left;">
							<input type="text" id="user_Id" name="M_ID" value="${sessionScope.userInfo.getM_ID()}" class="memberInputBox" readonly="readonly" maxlength="30" style="width: 100%; padding: inherit;" />
						</div>
					</div>
					<div class="row">
						<div class="col-sm-2">
							<p>패스워드</p>
						</div>
						<div class="col-sm-10" style="text-align: left;">
							<input type="password" name="M_PW" id="pw1" maxlength="30" class="memberInputBox" onkeypress="caps_lock(event);" />
							<br>
							<div class="alert alert-capslock" id="alert-capslock">
								<font style="color: red">capslock키가 눌려 있습니다.</font>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-sm-2">
							<p>패스워드 확인</p>
						</div>
						<div class="col-sm-10" style="text-align: left;">
							<input type="password" name="M_PWCorre" id="pw2" maxlength="30" class="memberInputBox" />
							<br>
							<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
							<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
						</div>
					</div>

					<div class="row">
						<div class="col-sm-2">
							<p>이름</p>
						</div>
						<div class="col-sm-10" style="text-align: left;">
							<input type="text" value="${sessionScope.userInfo.getM_NAME()}" readonly="readonly" name="M_NAME" id="name" maxlength="10" class="memberInputBox" />
						</div>
					</div>

					<div class="row">
						<div class="col-sm-2">
							<p>닉네임</p>
						</div>
						<div class="col-sm-10 row" style="text-align: left;">
							<div class="col-sm-9">
								<input type="text" id="user_NickName" value="${sessionScope.userInfo.getM_NICKNAME()}" name="M_NICKNAME" maxlength="30" class="memberInputBox" />
								<br>
								<div class="alert alert-nicksuccess" id="alert-nicksuccess">
									<font style="color: blue">사용할 수 있는 닉네임 입니다</font>
								</div>
								<div class="alert alert-nickdanger" id="alert-nickdanger">
									<font style="color: red">사용할 수 없는 닉네임 입니다</font>
								</div>
								<div class="alert alert-nickfresh" id="alert-nickfresh">
									<font style="color: red">중복검사를 실행해주세요</font>
								</div>
							</div>
							<input type="hidden" id="checkNick" name="checkNick" value="">
							<div class="col-sm-3">
								<input type="button" class="btnGray" style="width: 100%;" value="중복확인" id="user_nickName_checkBtn" />
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-sm-2">
							<p>이메일</p>
						</div>
						<div class="col-sm-10 row" style="text-align: left;">
							<input type="text" value="${sessionScope.userInfo.getM_EMAIL_ID()}" id="email1" name="M_EMAIL_ID" maxlength="30" class="memberInputBox" style="width: 45%;" />
							<br>
							<div class="alert alert-emailsuccess" id="alert-emailsuccess">
								<font style="color: blue">사용할 수 있는 이메일 입니다</font>
							</div>
							<div class="alert alert-emaildanger" id="alert-emaildanger">
								<font style="color: red">사용할 수 없는 이메일 입니다</font>
							</div>
							<div class="alert alert-emailfresh" id="alert-emailfresh">
								<font style="color: red">중복검사를 실행해주세요</font>
							</div>
							<input type="hidden" id="checkEmail" name="checkEmail" value="N">
							<input type="hidden" id="checkNum" name="checkNum" value="">
							<p>@</p>
							<input id="email2" name="M_EMAIL_DOMAIN" value="${sessionScope.userInfo.getM_EMAIL_DOMAIN()}" maxlength="30" class="memberInputBox" style="width: 45%;" />
						</div>
						<div class="col-sm-3">
							<input type="button" style="width: 100%;" value="중복확인" class="btnGray" id="user_Email_checkBtn" />
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-2"></div>
					<div class="col-sm-10">
						<input type="button" class="btnGray" style="width: 100%; vertical-align: top;" value="이메일 인증하기" id="" onclick="sendMail();" />
					</div>
				</div>

				<div class="row">
					<div class="col-sm-2">
						<p>전화번호</p>
					</div>
					<div class="col-sm-10" style="text-align: left;">
						<input type="text" id="t1" value="${sessionScope.userInfo.getM_CELLPHONE1()}" name="M_CELLPHONE1" maxlength="30" class="memberInputBox" />
						-
						<input type="text" id="t2" value="${sessionScope.userInfo.getM_CELLPHONE2()}" name="M_CELLPHONE2" maxlength="30" class="memberInputBox" />
						-
						<input type="text" id="t3" value="${sessionScope.userInfo.getM_CELLPHONE3()}" name="M_CELLPHONE3" maxlength="30" class="memberInputBox" />
					</div>
				</div>

				<div class="row">
					<div class="col-sm-2">
						<p>주소</p>
					</div>
					<div class="col-sm-8" style="text-align: left">
						<input type="text" name="M_ZIPCODE" readonly="readonly" class="memberInputBox" value="${sessionScope.userInfo.getM_ZIPCODE()}" id="sample6_postcode">
						<input type="text" name="M_ADDRESS1" class="memberInputBox" value="${sessionScope.userInfo.getM_ADDRESS1()}" id="sample6_address">
					</div>
					<div class="col-sm-2">
						<input type="button" onclick="sample6_execDaumPostcode()" style="width: 120px;" class="btnGray" value="우편번호 찾기">
					</div>
				</div>

				<div class="row">
					<div class="col-sm-2"></div>
					<div class="col-sm-10" style="text-align: left">
						<input type="text" name="M_ADDRESS2" class="memberInputBox" value="${sessionScope.userInfo.getM_ADDRESS2()}" id="sample6_address2">
					</div>
				</div>
				<div class="row"></div>
			</div>
			<div class="col-sm-4"></div>
			<hr>
			<div style="text-align: center; padding-bottom: 15px;">
				<input type="button" class="btnGreen" id="singUpBtn" value="정보수정" style="width: 200px; height: 40px;" onclick="" />
				<input type="button" class="btnGreen" value="취소" style="width: 200px; height: 40px" onclick="javascript:location.href='<%=cp%>'">
			</div>
		</div>
		</div>
	</form>
	<jsp:include page="../include/footer.jsp" flush="false" />
	<!-- 본문 끝 -->
	<script type="text/javascript">
		//한글입력방지
		$("#pw1").keyup(function(event) {
			if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[^a-z0-9]/gi, ''));
			}
		});
		$("#pw2").keyup(function(event) {
			if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[^a-z0-9]/gi, ''));
			}
		});
	</script>
</body>
</html>
