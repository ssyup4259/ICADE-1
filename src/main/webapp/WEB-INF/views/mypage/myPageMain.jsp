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
<script type="text/javascript">


$(function() {
    $('.hide').click(function(){
        $('.toggle').hide();
        setDisplayValue();
        $('#ch').toggleClass('hide'); 
        $('#ch').toggleClass('show'); 
    });
    $('.show').click(function(){
        $('.toggle').show();
        setDisplayValue();
    });
});

function setDisplayValue() {
    var display = $('.toggle')[0].style.display;
    $('.displayvalue').text(display);
}


</script>

</head>
<body>
	<jsp:include page="../include/header.jsp" flush="false" />
	<div class="container-fluid text-center" style="background-color: #F2F1F0; padding-top: 50px; padding-bottom: 50px;">
		<div class="container" style="width: 50%; border: 3px solid #A3C838; border-radius: 12px; font-size: 20px; padding-top: 20px;">
			<font style="font-size: 30px;"><b>마이 쇼핑</b></font>
			<hr style="border: 3px solid #DDDADB;">
			<div class="row">
				<div class="col-sm-2" style="text-align: right;">
					<p>가용포인트 :</p>
				</div>
				<div class="col-sm-6" style="text-align: left;">
					<p>${point}Point</p>
				</div>
				<div class="col-sm-4" style="text-align: right;">
					<a href="/myshop/mileage/historyList.html" class="button"><input type="button" class="btnGray" style="width: 200px;" value="조회"></a>
				</div>
			</div>

			<div class="row">
				<div class="col-sm-2" style="text-align: right;">
					<p>총포인트 :</p>
				</div>
				<div class="col-sm-10" style="text-align: left;">
					<p>2,700원</p>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-2" style="text-align: right;">
					<p>사용포인트 :</p>
				</div>
				<div class="col-sm-6" style="text-align: left;">
					<p>사용한 포인트 적는데</p>
				</div>
				<div class="col-sm-4" style="text-align: right;">
					<a href="/myshop/deposits/historyList.html" class="button"><input type="button" class="btnGray" style="width: 200px;" value="조회"></a>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-2" style="text-align: right;">
					<p>총주문 :</p>
				</div>
				<div class="col-sm-10" style="text-align: left;">
					<p>
						0원(
						<span id="xans_myshop_bankbook_order_count">0</span>
						회)
					</p>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-2" style="text-align: right;">
					<p>등 급 :</p>
				</div>
				<div class="col-sm-10" style="text-align: left;">
					<p>${sessionScope.userInfo.getM_RANK()}</p>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-2" style="text-align: right;">
					<p>아 이 디 :</p>
				</div>
				<div class="col-sm-10" style="text-align: left;">
					<p>${sessionScope.userInfo.getM_ID()}</p>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-2" style="text-align: right;">
					<p>닉 네 임 :</p>
				</div>
				<div class="col-sm-10" style="text-align: left;">
					<p>${sessionScope.userInfo.getM_NICKNAME()}</p>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-2" style="text-align: right;">
					<p>이 름 :</p>
				</div>
				<div class="col-sm-10" style="text-align: left;">
					<p>${sessionScope.userInfo.getM_NAME()}</p>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-2" style="text-align: right;">
					<p>주 소 :</p>
				</div>
				<div class="col-sm-10" style="text-align: left;">
					<p>${sessionScope.userInfo.getM_ZIPCODE()}${sessionScope.userInfo.getM_ADDRESS1()}${sessionScope.userInfo.getM_ADDRESS2()}</p>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-2" style="text-align: right;">
					<p>이 메 일 :</p>
				</div>
				<div class="col-sm-10" style="text-align: left;">
					<p>${sessionScope.userInfo.getM_EMAIL_ID()}@${sessionScope.userInfo.getM_EMAIL_DOMAIN()}</p>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-2" style="text-align: right;">
					<p>전화번호 :</p>
				</div>
				<div class="col-sm-10" style="text-align: left;">
					<p>${sessionScope.userInfo.getM_CELLPHONE1()}-${sessionScope.userInfo.getM_CELLPHONE2()}-${sessionScope.userInfo.getM_CELLPHONE3()}</p>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-2" style="text-align: right;">
					<p>포 인 트 :</p>
				</div>
				<div class="col-sm-10" style="text-align: left;">
					<p>${point}</p>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-2" style="text-align: right;">
					<p>가 입 일 :</p>
				</div>
				<div class="col-sm-10" style="text-align: left;">
					<p>${sessionScope.userInfo.getM_DATE()}</p>
				</div>
			</div>
			<br>
			<input type="button" value="정보수정" onclick="sendIt('change');" class="btnGreen" style="width: 200px;">
			<input type="button" value="회원탈퇴" onclick="sendIt('cancel');" class="btnGreen" style="width: 200px;">
			<input type="button" value="주문내역조회" id="orderHistory" class="btnGreen" style="width: 200px;">
			<input type="button" value="주소록" class="btnGreen" style="width: 200px;">
			<br>
	
			
			<br>
		</div>
	</div>


	<p>
    <button id="ch" class="hide" value="찜리스트 펼치기">찜리스트 숨기기</button>
    <button class="show" value="찜리스트 숨기기">찜리스트 펼치기</button>
	
	</p>
	
	<div class="toggle">
	<table style="text-align: center;" border="1" cellpadding="10" cellspacing="0">
	 	<c:forEach var="w_dto" items="${wishList}">
	<tr>
		<td>
		<a href="<%=cp%>/goods/goodsArticle.action?G_NUM=${w_dto.getW_GNUM()}">
		<img src="<%=cp%>/resources/goodsImage/${w_dto.getW_SAVEFILENAME()}" width="100" height="100"/>
		</a>
		상품명:${w_dto.getW_NAME()}
		</td>
	</tr>
		</c:forEach>
	<tr>
	 <td colspan="9">
		<c:if test="${dataCount!=0 }">
		${pageIndexList }
		</c:if>
		<c:if test="${dataCount==0 }">
		찜 등록된 상품이 없습니다.
		</c:if>
	 </td>
	</tr>
	</table>
	</div>

	
	</div>
	
	
	<script type="text/javascript">
		$("#orderHistory").click(function() {
			document.location.href = "orderHistory.action";
		});

		function sendIt(mode) {
			window.location.href = "infoCheckPage.action?mode=" + mode;
		}
	</script>
</body>
</html>