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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">

	$(function() {
		$('.showWish').click(function() {
			$('.toggle').hide();
			setDisplayValue();
			$('#ch').toggleClass('hideWish');
			$('#ch').toggleClass('showWish');
		});
		$('.hideWish').click(function() {
			$('.toggle').show();
			setDisplayValue();
		});
	});

	function setDisplayValue() {
		var display = $('.toggle')[0].style.display;
		$('.displayvalue').text(display);
	}
</script>


<style type="text/css">

.hideWish {
	background-color: white;
	color: #A3C838;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	cursor: pointer;
	border: 3px solid #A3C838;
	border-radius: 6px;
	height: 40px;
}

.showWish {
	background-color: white;
	color: #A3C838;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	cursor: pointer;
	border: 3px solid #A3C838;
	border-radius: 6px;
	height: 40px;
}

</style>

<script type="text/javascript">
	function deleteAllWish(){

		$.ajax({
		url:'<%=cp%>/wish/deleteAllWish.action',
		type:'POST',
		datatype:  'text',
		}).done(function(map) {
			var msg =map.msg;
			$('#wishList').load(document.URL +  ' #wishList');
			swal(msg);
			
		}).fail(function(){
			swal("실패");
		});
		
		
		
	}
</script>
<script type="text/javascript">
	function deleteWish(G_NUM){
	
		$.ajax({
		url:'<%=cp%>/wish/deleteWish.action',
		type:'POST',
		data:{"G_NUM":G_NUM},
		datatype:  'text',
		}).done(function(map) {
			var G_NAME=map.G_NAME;
			var G_NUM =map.G_NUM;
			$('#wishList').load(document.URL +  ' #wishList');
			swal("상품명 :"+G_NAME+"가 삭제 되었습니다");
		}).fail(function(){
			swal("실패");
		});
		
		
		
	}
</script>

</head>
<body>
	<jsp:include page="../include/header.jsp" flush="false" />
	<div class="container-fluid text-center" style="background-color: #F2F1F0; padding-top: 50px; padding-bottom: 50px;">
		<div class="container text-center">
			<div class="row">
				<div class="col-sm-8" style="border: 3px solid #A3C838; border-radius: 12px; font-size: 20px; padding-top: 20px;">

					<font style="font-size: 30px;"><b>마이 쇼핑</b></font>
					<p>
						
						<button class="showWish" value="찜리스트 숨기기">찜리스트 펼치기</button>
						<button id="ch" class="hideWish" value="찜리스트 펼치기">찜리스트 숨기기</button>

					</p>
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
					<input type="button" value="정보수정" onclick="sendMode('change');" class="btnGreen" style="width: 170px;">
					<input type="button" value="회원탈퇴" onclick="sendMode('cancel');" class="btnGreen" style="width: 170px;">
					<input type="button" value="주문내역조회" id="orderHistory" onclick="location.href='orderHistory.action'" class="btnGreen" style="width: 170px;">
					<input type="button" value="주소록" class="btnGreen" style="width: 170px;">
					<br>

					<br>

				</div>
				<div class="col-sm-4 toggle" style="display: none;">



	
	
	<div class="toggle" id="wishList">
	<input type="button" value="찜목록 전체 삭제" class="btnGreen" onclick="deleteAllWish();" style="width: 200px;"/>
	<table style="text-align: center;" border="1" cellpadding="10" cellspacing="0">
	 	<c:forEach var="w_dto" items="${wishList}">
	<tr>
		<td>
		<a href="<%=cp%>/goods/goodsArticle.action?G_NUM=${w_dto.getW_GNUM()}">
		<img src="<%=cp%>/resources/goodsImage/${w_dto.getW_SAVEFILENAME()}" width="100" height="100"/>
		</a>
		상품명:${w_dto.getW_NAME()}
		<input type="button" onclick="deleteWish(${w_dto.getW_GNUM()});" class="btnGreen" style="width: 200px;" value="찜 삭제">
		</td>
	</tr>
		</c:forEach>
	<tr>
	 <td colspan="9">
		<c:if test="${dataCount!=0 }">
		${pageIndexList }
		</c:if> <c:if test="${dataCount==0 }">
		찜 등록된 상품이 없습니다.
		</c:if></td>
						</tr>
					</table>

				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
		$("#orderHistory").click(function() {
			document.location.href = "orderHistory.action";
		});

		function sendMode(mode) {
			window.location.href = "infoCheckPage.action?mode=" + mode;
		}
	</script>
</body>
</html>