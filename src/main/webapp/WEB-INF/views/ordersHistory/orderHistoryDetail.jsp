<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
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
<link rel="shortcut icon" href="<%=cp%>/resources/images/favicon.ico">

<script src="<%=cp%>/resources/data/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<style type="text/css">
tr {
	border: none;
}

table {
	border: 3px solid #8F9493;
	border-radius: 12px;
}
</style>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../include/header2.jsp" flush="false" />
	<div class="container-fluid text-center" style="background-color: #F2F1F0; padding-top: 50px; padding-bottom: 50px;">
		<div class="container" style="text-align: left;">

			<h1>구매상세내역</h1>

			<script type="text/javascript">
				document.domain = "icade.com";
			</script>

			<script language="JavaScript" type="text/javascript" src="https://iniweb.inicis.com/js/auth.js"></script>

			<!-- 배송준비~배송완료이미지 -->
			<div class="row">
				<div class="col-sm-3" style="text-align: left; font-size: 20px;">
					결제번호 : ${O_Num}
					<br>
					주문일 : ${O_Date}
				</div>
				<div class="col-sm-9">
					<img src="//image.wemakeprice.com/images/resources/wmp/pages/mypage/banner/mypage-invoice.jpg" style="width: 100%;">
				</div>
			</div>

			<h2>구매목록</h2>
			<table cellspacing="0" width="100%" class="tbl_mypage tbl_detail" summary="구매목록의 주문일자(주문번호),주문 상품 정보, 총 결제금액,상태등을 노출하는 테이블">
				<colgroup>
					<col width="7.5%">
					<col width="15%">
					<col width="34%">
					<col width="5%">
					<col width="10%">
					<col width="12.5%">
					<col width="8.0%">
					<col width="8.0%">
				</colgroup>
				<thead>
					<tr>
						<th scope="col" colspan="3">주문상품정보</th>
						<th scope="col">수량</th>
						<th scope="col">상품금액</th>
						<th scope="col">배송비</th>
						<th scope="col">상태</th>
						<th scope="col">조회</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${detailLists}" var="dto">
						<tr class="fst">
							<td><a href="/icade/goods/goodsArticle.action?G_NUM=${dto.getGD_NUM()}"><img src="/icade/resources/goodsImage/${dto.getG_SAVEFILENAME()}" width="50" height="50"></a></td>
							<td><a href="/icade/goods/goodsArticle.action?G_NUM=${dto.getGD_NUM()}">${dto.getOD_NAME()} </a></td>
							<td>${dto.getOD_NAME()}-${dto.getOD_DEVICE()}-${dto.getOD_COLOR()}×${dto.getOD_COUNT()}개</td>

							<td>${dto.getOD_COUNT()}</td>
							<!--1 노출갯수-->
							<td><fmt:formatNumber value="${dto.getOD_PRICE()}" pattern="#,###" />원</td>
							<td rowspan="1">
								<div class="buy_dl_info">0원(배송비)</div>
							</td>
							<td class="cont2" rowspan="1">${Recipientdto.getO_STATUS()}</td>
							<td><a class="btn_flexible btn_flexible02" onclick="window.open('http://www.deliverytracking.kr/?dummy=one&deliverytype={택배사코드}&keyword=${Recipientdto.getO_TNUM()}','delivery_popup','width=0, height=0, toolbar=no, menubar=no, scrollbars=yes, status=no, resizable=yes');" href="javascript:;"><span class="inner">배송조회</span>
							</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>



			<h2>받는 사람 정보</h2>
			<table cellspacing="0" width="100%" class="tbl_mypage_info" summary="구매자 정보 - 주문자,휴대폰,이메일">
				<colgroup>
					<col width="150">
					<col width="226">
					<col width="151">
					<col width="225">
				</colgroup>
				<tbody>
					<tr class="fst">
						<th scope="row" class="fst">받는사람</th>
						<td colspan="3">${Recipientdto.getO_NAME()}</td>
					</tr>
					<tr>
						<th scope="row" class="fst">휴대폰</th>
						<td>${Recipientdto.getO_PH()}</td>
					</tr>
					<tr>
						<th scope="row" class="fst">주소</th>
						<td colspan="3" id="addr"> 
							<span class="way_name">
								${Recipientdto.getO_ZIPCODE()}<br /> ${Recipientdto.getO_ADDRESS1()} - ${Recipientdto.getO_ADDRESS2()}
							</span>
						</td>
					</tr>
				</tbody>
			</table>

			<h2>결제 정보</h2>
			<table cellspacing="0" width="100%" class="" summary="결제 정보 - 주문금액,환불금액,결제금액">
				<colgroup>
					<col width="150">
					<col width="226">
					<col width="376">
				</colgroup>
				<tbody>
					<tr class="">
						<th scope="" class="">주문금액</th>
						<td><fmt:formatNumber value="${Recipientdto.getO_TOT()+Recipientdto.getO_POINT()}" pattern="#,###" />원</td>
						<td>상품금액 <fmt:formatNumber value="${Recipientdto.getO_TOT()}" pattern="#,###" />원 (사용포인트 ${Recipientdto.getO_POINT()} Point)
						</td>
					</tr>
					<tr>
						<th scope="row" class="fst">결제금액</th>
						<td><strong class="point"><fmt:formatNumber value="${Recipientdto.getO_TOT()}" pattern="#,###" />원</strong></td>
						<td>${Recipientdto.getO_WAY()}</td>
					</tr>
				</tbody>
			</table>
			<br>
			<br>
			<input type="button" class="btnGreen" value="목록으로 돌아가기" style="width: 250px; float: right;" onclick="history.back();return false;">
			<br><br>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp" flush="false" />

	<script type="text/javascript">
		$(document).ready(function() {
			$('.btnHelpOption').hover(function() {
				$(this).next().show();
			}, function() {
				$(this).next().hide();
			});
		});
	</script>



</body>
</html>