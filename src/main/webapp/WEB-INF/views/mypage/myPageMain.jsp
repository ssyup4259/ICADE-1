<%@page import="org.springframework.http.HttpRequest"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/icade.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-grid.min.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-panel.css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

<title>마이 쇼핑</title>
<script src="<%=cp%>/resources/data/js/bootstrap.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
	<jsp:include page="../include/header.jsp" flush="false" />
	<div class="container-fluid text-center" style="background-color: #F2F1F0; padding-top: 50px; padding-bottom: 50px;">
		<div class="container">
			<h1>마이 쇼핑</h1>
			<hr style="border: 1px solid black;">
			<div class="row">
				<div class="col-sm-2">
					<p>가용포인트</p>
				</div>
				<div class="col-sm-8" style="text-align: left;">${point}Point</div>
				<div class="col-sm-2" style="padding-top: 0;">
					<a href="/myshop/mileage/historyList.html" class="button"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_result.gif" alt="조회"></a>
				</div>
			</div>

			<div class="row">
				<div class="col-sm-2">
					<p>총포인트</p>
				</div>
				<div class="col-sm-8" style="text-align: left;">2,700원</div>
			</div>
			<div class="row">
				<div class="col-sm-2">
					<p>사용포인트</p>
				</div>
				<div class="col-sm-8" style="text-align: left;">
					<a href="/myshop/deposits/historyList.html" class="button"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_result.gif" alt="조회"></a>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-2">
					<p>총주문</p>
				</div>
				<div class="col-sm-8" style="text-align: left;">
					0원(
					<span id="xans_myshop_bankbook_order_count">0</span>
					회)</strong>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-2">
					<p>등 급 :</p>
				</div>
				<div class="col-sm-8" style="text-align: left;">${sessionScope.userInfo.getM_RANK()}</div>
			</div>
			<div class="row">
				<div class="col-sm-2">
					<p>아 이 디</p>
				</div>
				<div class="col-sm-8" style="text-align: left;">${sessionScope.userInfo.getM_ID()}</div>
			</div>
			<div class="row">
				<div class="col-sm-2">닉 네 임</div>
				<div class="col-sm-8" style="text-align: left;">${sessionScope.userInfo.getM_NICKNAME()}</div>
			</div>
			<div class="row">
				<div class="col-sm-2">
					<p>이 름</p>
				</div>
				<div class="col-sm-8" style="text-align: left;">${sessionScope.userInfo.getM_NAME()}</div>
			</div>
			<div class="row">
				<div class="col-sm-2">
					<p>주 소</p>
				</div>
				<div class="col-sm-8" style="text-align: left;">${sessionScope.userInfo.getM_ZIPCODE()}${sessionScope.userInfo.getM_ADDRESS1()}${sessionScope.userInfo.getM_ADDRESS2()}</div>
			</div>
			<div class="row">
				<div class="col-sm-2">
					<p>이 메 일</p>
				</div>
				<div class="col-sm-8" style="text-align: left;">${sessionScope.userInfo.getM_EMAIL_ID()}@${sessionScope.userInfo.getM_EMAIL_DOMAIN()}</div>
			</div>
			<div class="row">
				<div class="col-sm-2">
					<p>전화번호</p>
				</div>
				<div class="col-sm-8" style="text-align: left;">${sessionScope.userInfo.getM_CELLPHONE1()}-${sessionScope.userInfo.getM_CELLPHONE2()}-${sessionScope.userInfo.getM_CELLPHONE3()}</div>
			</div>
			<div class="row">
				<div class="col-sm-2">포 인 트</div>
				<div class="col-sm-8" style="text-align: left;">${point}</div>
			</div>
			<div class="row">
				<div class="col-sm-2">가 입 일</div>
				<div class="col-sm-8" style="text-align: left;">${sessionScope.userInfo.getM_DATE()}</div>
			</div>

			<input type="button" value="정보수정" onclick="sendIt('change');" class="btnGreen" style="width: 250px;">
			<input type="button" value="회원탈퇴" onclick="sendIt('cancel');" class="btnGreen" style="width: 250px;">
			<input type="button" value="주문내역조회" id="orderHistory" class="btnGreen" style="width: 250px;">
			<input type="button" value="주소록" class="btnGreen" style="width: 250px;">
		</div>
	</div>


	<jsp:include page="../include/footer.jsp" flush="false" />
	</div>
<script type="text/javascript">

	$("#orderHistory").click(function(){
		document.location.href = "orderHistory.action";
	});
	
	function sendIt(mode) {
		window.location.href = "infoCheckPage.action?mode=" + mode;
	}
</script>
</body>
</html>