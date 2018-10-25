<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 찾기</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/icadeStyle.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-grid.min.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-panel.css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

<script src="<%=cp%>/resources/data/js/bootstrap.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>

</head>
<body>

<jsp:include page="../include/header.jsp" flush="false" />

<div style="margin-left: 15%;">
	<h2>아이디 찾기</h2>
	가입하신 방법에 따라 아이디 찾기가 가능합니다.<br/>
	법인사업자 회원 또는 외국인 회원의 경우 법인명과 법인번호 또는 이름과 등록번호를 입력해 주세요.
</div>

<br/><br/>

<div style="margin: 0 auto; width: 70%">
	<form id="findIdForm" name="findIdForm" action="" method="post">
		<fieldset>
			<div style="width: 30%; margin: 0 auto;">
				<br/>
				<div style="padding: 10px 0px 10px 0px; width: 170px; margin: 0 auto;">
					<input id="check_method1" name="check_method" value="2" type="radio" checked="checked">
					<label for="check_method1">이메일</label>
					<input id="check_method2" name="check_method" value="3" type="radio">
					<label for="check_method2">
						<span id="search_type_mobile_lable" style="display: inline;">휴대폰번호</span>
					</label>
				</div>
				
				<div id="name_view" style="margin: 10px 0px 10px 0px;">
					<strong id="name_lable" style="margin-right: 23%;">이름</strong>
					<input id="name" name="name" value="" type="text" class="inputBox" style="width: 200px;">
				</div>
				
				<div id="email_view" style="margin: 10px 0px 10px 0px;">
					<strong style="margin-right: 8%;">이메일로 찾기</strong>
					<input id="email" name="email" style="width: 200px;" class="inputBox" fw-filter="isEmail" value="" type="text">
				</div>
				
				<div style="margin: 10px 0px 10px 0px; display: none;">
					<strong>휴대폰 번호로 찾기</strong>
					<input id="mobile1" name="mobile1" style="width: 54px;" class="inputBox" maxlength="3" value="" type="text">
					 - 
					<input id="mobile2" name="mobile2" style="width: 54px;" class="inputBox" maxlength="4" value="" type="text">
					 - 
					<input id="mobile3" name="mobile3" style="width: 54px;" class="inputBox" maxlength="4" value="" type="text">
				</div>
				<br/>
				<div style="width: 90px; margin: 0 auto;">
					<a href="#" onclick="">
						<img src="//img.echosting.cafe24.com/skin/base_ko_KR/member/btn_submit.gif" alt="확인">
					</a>
				</div>
				<br/>
			</div>
		</fieldset>
	</form>
</div>

<jsp:include page="../include/footer.jsp" flush="false" />

</body>
</html>