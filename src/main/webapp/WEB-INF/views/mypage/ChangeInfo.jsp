<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String cp = request.getContextPath();
	Date dt = new Date();
	
	Object v = dt.getTime();
	
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Keywords" content="회원정보수정" />
<meta name="Description" content="회원정보수정" />
<title>아이폰 케이스는 ICADE</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-grid.min.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-panel.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/icade.css?<%=v%>">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
<link rel="shortcut icon" href="<%=cp%>/resources/images/favicon.ico">

<script src="<%=cp%>/resources/data/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>


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

.Dash{
	margin-top : 10px;
	display: table-cell;
	vertical-align: middle;
}

.memberInputBoxGray {
	border-color: #8F9493;
	color: black;
	text-align: center;
	font-size: 18px;
	border: 3px solid #A3C838;
	border-radius: 6px;
	height: 40px;
	width: 100%;
	height: 40px;
	background-color: transparent;
	webkit-ime-mode: disabled;
}

</style>
</head>


<body>
	<!-- 본문 -->
	<jsp:include page="../include/header2.jsp" flush="false" />
	<input type="hidden" id="msg" value="">
	<!-- 내용 -->
	<form name="joinForm" action="" method="post" id="joinForm">
		<div class="container-fluid" style="background-color: #F2F1F0; padding-top: 50px; padding-bottom: 50px;">
			<div class="container text-center" style="margin-left: 20%;">
				<div class="row">
					<div class="col-sm-6" style="text-align: left;">
						<h2>회원 정보 수정</h2>
						<span style="font-size: 15px; font-weight: 300;">개인 정보 수정 페이지 입니다.</span>
					</div>
					<div class="col-sm-6" style="text-align: right;">
					</div>
				</div>
				<br>
				<div class="col-sm-8">
					<hr style="border: 1px solid black; width:150%; margin-left: -9px">
				</div>
				
				<div class="col-sm-8" align="center" style="margin: 0 auto;">
					<div class="row">
						<div class="col-sm-2">
							<p>아이디</p>
						</div>
						<div class="col-sm-8" style="text-align: left;">
							<input type="text" style="border-color: #8F9493" id="user_Id" name="M_ID" value="${sessionScope.userInfo.getM_ID()}" class="memberInputBoxGray" readonly="readonly" maxlength="30" />
							<br>
							<div class="alert alert-idsuccess" id="alert-idsuccess" style="display: none;">
								<font style="color: blue">사용할 수 있는 아이디 입니다</font>
							</div>
							<div class="alert alert-iddanger" id="alert-iddanger" style="display: none;">
								<font style="color: red">사용할 수 없는 아이디 입니다</font>
							</div>
							<div class="alert alert-idrefresh" id="alert-idrefresh" style="display: none;">
								<font style="color: red">중복검사를 실행해주세요</font>
							</div>
							<input type="hidden" id="checkId" name="checkId" value="">
						</div>
						<div class="col-sm-2" style="padding-top: 0;">
							<input type="button" value="중복확인" style="width: 120px; display: none;" class="btnGray" id="user_id_checkBtn" />
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-sm-2">
							<p>패스워드</p>
						</div>
						<div class="col-sm-8" style="text-align: left;">
							<input type="password" name="M_PW" id="pw1" maxlength="30" class="memberInputBox" size="15" onkeypress="caps_lock(event);">
							<br>
							<div class="alert alert-capslock" id="alert-capslock" style="display: none;">
								<font style="color: red;">capslock키가 켜져 있습니다.</font>
							</div>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-sm-2">
							<p>
								패스워드 확인
							</p>
						</div>
						<div class="col-sm-8" style="text-align: left;">
							<input type="password" name="M_PWCorre" id="pw2" maxlength="30" class="memberInputBox" size="15"/>
							<br>
							<div class="alert alert-success" id="alert-success" style="display: none;">비밀번호가 일치합니다.</div>
							<div class="alert alert-danger" id="alert-danger" style="display: none;">비밀번호가 일치하지 않습니다.</div>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-sm-2">
							<p>이름</p>
						</div>
						<div class="col-sm-8" style="text-align: left;">
							<input type="text" style="border-color: #8F9493" value="${sessionScope.userInfo.getM_NAME()}" readonly="readonly" name="M_NAME" id="name" maxlength="10" class="memberInputBoxGray" size="15"/>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-sm-2" style="margin-top: 11px">
							닉네임
						</div>
						<div class="col-sm-8" style="text-align: left;">
							<input type="text" id="user_NickName" style="position: absolute; width: 94%;" value="${sessionScope.userInfo.getM_NICKNAME()}" name="M_NICKNAME" maxlength="30" class="memberInputBox" size="15"/>
							<input type="hidden" id="user_NickName_session" value="${sessionScope.userInfo.getM_NICKNAME()}" >
							<br>
							<div>&nbsp;</div>
							<div class="alert alert-nickequals" id="alert-nickequals" style="display: none;">
								<font style="color: blue">현재 사용하시는 닉네임 입니다</font>
							</div>
							<div class="alert alert-nicksuccess" id="alert-nicksuccess" style="display: none;">
								<font style="color: blue">사용할 수 있는 닉네임 입니다</font>
							</div>
							<div class="alert alert-nickdanger" id="alert-nickdanger" style="display: none;">
								<font style="color: red">사용할 수 없는 닉네임 입니다</font>
							</div>
							<div class="alert alert-nickfresh" id="alert-nickfresh" style="display: none;">
								<font style="color: red">중복검사를 실행해주세요</font>
							</div>
							<input type="hidden" id="checkNick" name="checkNick" value="">
						</div>
						<div class="col-sm-2">
							<input type="button" class="btnGray" style="width: 120px;" value="중복확인" id="user_nickName_checkBtn" />
						</div>
					</div>
					<br>
					<div class="row" style="margin-top: 30px;">
						<div class="col-sm-2">
							<p>이메일</p>
						</div>
						<div class="col-sm-4" style="text-align: left; float: left;">
								<input type="text" class="memberInputBox" value="${sessionScope.userInfo.getM_EMAIL_ID()}" id="email1" name="M_EMAIL_ID" maxlength="30" style="width: 100%;margin: 0px;padding: 0px"/>
								<input type="hidden" id="Sessionid" value="${sessionScope.userInfo.getM_EMAIL_ID()}""/>
								<input type="hidden" id="checkEmail" name="checkEmail" value="N">
								<input type="hidden" id="checkNum" name="checkNum" value="">
						</div>
						<div class="col-sm-1">
						<font style="font-size: 30px;border: 0px">@</font>
						</div>
						<div class="col-sm-3" >
							<!-- <input id="email2" class="memberInputBox" name="M_EMAIL_DOMAIN" placeholder="Ex) hanmail.net" maxlength="30" style="width: 100%;;margin-left: 0px"/> -->
							<input type="hidden" id="Sessiondomain" value="${sessionScope.userInfo.getM_EMAIL_DOMAIN()}"/>
							<select id="email2" name="M_EMAIL_DOMAIN" class="memberInputBox">
				                <option value="" selected="selected">- 이메일 선택 -</option>
				                <option value="naver.com">naver.com</option>
				                <option value="daum.net">daum.net</option>
				                <option value="nate.com">nate.com</option>
				                <option value="hotmail.com">hotmail.com</option> 
				                <option value="yahoo.com">yahoo.com</option>
				                <option value="empas.com">empas.com</option>
				                <option value="korea.com">korea.com</option>
				                <option value="dreamwiz.com">dreamwiz.com</option>
				                <option value="gmail.com">gmail.com</option>
				                <option value="etc">직접입력</option>
			                </select>
						</div>
						<div class="col-sm-2" style="float: right;">
							<input id="user_Email_checkBtn" class="btnGray" value="중복확인" style="width: 100%; position: absolute; margin-left:-45px;" type="button">
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-sm-8" style="float: center;">
							<div class="alert alert-emailequals" id="alert-emailequals" style="padding-bottom: 10px; display: none;">
								<font style="color: blue">현재 사용하시는 이메일 입니다</font>
							</div>
							<div class="alert alert-emailsuccess" id="alert-emailsuccess" style="padding-bottom: 10px; display: none;">
								<font style="color: blue">사용할 수 있는 이메일 입니다</font>
							</div>
							<div class="alert alert-emaildanger" id="alert-emaildanger" style="padding-bottom: 10px;text-align: center; display: none;">
								<font style="color: red">사용할 수 없는 이메일 입니다</font>
							</div>
							<div class="alert alert-emailfresh" id="alert-emailfresh" style="padding-bottom: 10px; display: none;">
								<font style="color: red">중복검사를 실행해주세요</font>
							</div>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-sm-2"></div>
						<div class="col-sm-8" style="text-align: left;">
							<input type="button" class="btnGray" style="width: 100%;" value="이메일 인증하기" id="" onclick="sendMail();" />
						</div>
						<div class="col-sm-2"></div>
					</div>
					
					<div class="col-sm-8">
						<hr style="border: 1px solid black; width:108%; margin-left: -9px">
					</div>
					<br>
			<%-- 		<div class="row">
						<div class="col-sm-2">
							<p>전화번호</p>
						</div>
						<div class="col-sm-2" style="text-align: left;">
							<input type="text" id="t1" value="${sessionScope.userInfo.getM_CELLPHONE1()}" name="M_CELLPHONE1" maxlength="3" class="memberInputBox" size="10" />
						</div>
						<div class="Dash" style="margin-left: 10px;margin-right:10px;padding-top: 3px">-</div>
						<div class="col-sm-3" style="text-align: left;padding-right: 0px;padding-left: 0px" align="center">
							<input type="text" id="t2" value="${sessionScope.userInfo.getM_CELLPHONE2()}" name="M_CELLPHONE2" maxlength="4" class="memberInputBox" size="10" style="width: 110px;padding-right: 0px"/>
						</div>
						<div class="Dash" style="padding-top: 3px">-</div>
						<div class="col-sm-3" style="text-align: left;" align="left">
							<input type="text" id="t3" value="${sessionScope.userInfo.getM_CELLPHONE3()}" name="M_CELLPHONE3" maxlength="4" class="memberInputBox" size="10"style="width: 110px" />
						</div>
					</div>
				<br> --%>
				<div class="row">
						<div class="col-sm-2" style="margin-top: 11px">
							전화번호
						</div>
						<div class="col-sm-2" style="text-align: left;padding-right: 22px">
							<input type="text" class="memberInputBox" id="t1" placeholder="Ex) 010" name="M_CELLPHONE1" maxlength="3"  value="${sessionScope.userInfo.getM_CELLPHONE1()}" />
						</div>
						<span style="padding-top: 13px;padding-left: 4px">-</span>
						<div class="col-sm-3" style="text-align: center;left;margin-right: 0px;margin-left: 0px;padding-left: 0px;padding-right: 0px;">
							<input type="text" class="memberInputBox" id="t2" placeholder="Ex) 0000" name="M_CELLPHONE2" maxlength="4" style="width: 131px"  value="${sessionScope.userInfo.getM_CELLPHONE2()}"/>
						</div>
						<span style="padding-top: 13px;padding-right: 5px">-</span>
						<div class="col-sm-3" style="text-align: left;">
							<input type="text" class="memberInputBox" id="t3" placeholder="Ex) 1234" name="M_CELLPHONE3" maxlength="4" style="width: 133px;padding-left: 20px;padding-right: 10px"  value="${sessionScope.userInfo.getM_CELLPHONE3()}" />
						</div>
					</div>
				<br>
				<div class="row">
					<div class="col-sm-2">
						<p>주소</p>
					</div>
					<div class="col-sm-5" style="text-align: left" align="right">
						<input type="text" name="M_ZIPCODE" readonly="readonly" class="memberInputBox" value="${sessionScope.userInfo.getM_ZIPCODE()}" id="sample6_postcode">
					</div>
					&nbsp;
					<div class="col-sm-3" style="text-align: left;margin-left: 2px" align="left">
						<input type="button" onclick="sample6_execDaumPostcode()" style="width: 120px;margin-left: 28px" class="btnGray" value="우편번호 찾기">
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-sm-2"></div>
					<div class="col-sm-5" style="text-align: left">
						<input type="text" name="M_ADDRESS1" class="memberInputBox" value="${sessionScope.userInfo.getM_ADDRESS1()}" id="sample6_address" readonly="readonly">
					</div>
					<div class="Dash" style="padding-top: 2px">-</div>
					<div class="col-sm-3" style="text-align: left">
						<input type="text" name="M_ADDRESS2" class="memberInputBox" value="${sessionScope.userInfo.getM_ADDRESS2()}" id="sample6_address2" style="width:96%;">
					</div>
				</div>
				<div class="row"></div>
			</div>
			<div class="col-sm-4"></div>
			
			<div class="col-sm-8">
				<hr style="border: 1px solid black; width:150%; margin-left: -9px">
			</div>
			
			<div style="text-align: center; padding-bottom: 15px; margin: 0 auto;">
				<input type="button" class="btnGreen" id="singUpBtn" value="정보수정" style="width: 200px; height: 40px;" onclick="" />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="btnGreen" value="취소" style="width: 200px; height: 40px;margin-left: 10px" onclick="javascript:location.href='<%=cp%>'">
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
