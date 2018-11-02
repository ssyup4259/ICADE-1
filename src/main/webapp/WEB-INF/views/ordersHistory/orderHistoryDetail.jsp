<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<% String cp = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/icade.css">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../include/header.jsp" flush="false" />

<div id="content_area" height="100%"><script type="text/javascript">
document.domain = "wemakeprice.com";
</script>

<script language="JavaScript" type="text/javascript" src="https://iniweb.inicis.com/js/auth.js"></script>

<div class="mypage_change_banner">                                 
    <img src="//image.wemakeprice.com/images/resources/wmp/pages/mypage/banner/mypage-invoice.jpg" alt="1.배송준비중2.상품출고대기3.상품출고4.배송중5.배송완료">                                                           
</div>
<h3 class="tit_mypage tit_buylist_view">구매상세내역</h3>
<div class="box_buylist_info">
	<div class="noti_area">
	<span class="srno"><strong>결제번호</strong> : ${O_Num}</span>
	<span><strong>주문일</strong> : 2018-10-08</span>
	</div>


	<div class="btn-area">
		<a id="btn_all_cancel" class="btn_flexible btn_flexible01" onclick="popUp('/mypage/cancel_request_pop/648361552', 'wemakeprice_pop_cancel', 820, 700, 1, 1, 0);" style="display: none;"><span class="inner">전체주문취소</span></a>
<!-- 									<a style="cursor:pointer;" class="btn_flexible btn_flexible04" onclick="showReceipt('https://iniweb.inicis.com/app/publication/apReceipt.jsp?noTid=StdpayISP_wemake000320181008215742908451&amp;noMethod=1', '4','648361552');"><span class="inner">영수증 조회</span></a> -->
							</div>
</div>
<table cellspacing="0" width="100%" class="tbl_mypage tbl_detail" summary="구매목록의 주문일자(주문번호),주문 상품 정보, 총 결제금액,상태등을 노출하는 테이블">
	<caption class="hidden">구매목록</caption>
		<colgroup>
			<col width="*">
			<col width="39">
			<col width="79">
			<col width="85">
			<col width="78">
		</colgroup>
	<thead>
		<tr>
			<th class="frt" colspan="5"></th>
		</tr>
		<tr>
			<th scope="col" class="fst">주문상품정보</th>
			<th scope="col">수량</th>
			<th scope="col">상품금액</th>
			<th scope="col">배송비</th>
			<th scope="col">상태</th>
		</tr>
		<tr>
			<th class="rast" colspan="5"></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${detailLists}" var="dto">
			<tr class="fst">
				<td class="cont ta_left fst">
					<div class="box_thumb">
						<a href="/<%=cp%>/goods/${dto.getOD_CODE()}"><img src="/icade/resources/data/logo/logo1.jpg" width="50" height="50" alt="<%=cp%>"><strong class="tit"> ${dto.getOD_NAME()}</strong></a>
					</div>
					<ul class="list_dot">
						<li>${dto.getOD_NAME()}-${dto.getOD_DEVICE()}-${dto.getOD_COLOR()}×${dto.getOD_COUNT()}개</li>
					</ul>
				</td>
			
				<td>${dto.getOD_COUNT()}</td>
				<!--1 노출갯수-->
				<td>${dto.getOD_PRICE()}원</td>
				<td rowspan="1">
					<div class="buy_dl_info">0원(배송비)</div>
				</td>
				
				<td class="cont2" rowspan="1">배송완료 <br>
					<a class="btn_flexible btn_flexible02" onclick="window.open('/mypage/delivery_popup/801797022/','delivery_popup','width=0, height=0, toolbar=no, menubar=no, scrollbars=yes, status=no, resizable=yes');" href="javascript:;">
						<span class="inner">배송조회</span>
					</a>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>



<div class="box_tit_mypage">
	<h3 class="tit_mypage tit_recipient">받는 사람 정보</h3>
	</div>
<table cellspacing="0" width="100%" class="tbl_mypage_info" summary="구매자 정보 - 주문자,휴대폰,이메일">
	<caption class="none">받는 사람 정보</caption>
	<colgroup>
		<col width="150">
		<col width="226">
		<col width="151">
		<col width="225">
	</colgroup>
	<tbody>
				<tr class="fst">
			<th scope="row" class="fst">받는사람</th>
			<td colspan="3">이름</td>
		</tr>
		<tr>
			<th scope="row" class="fst">휴대폰</th>
				<td>010-5554-4632</td>
			<th scope="row">안심번호</th>
				<td>사용안함</td>
		</tr>
		<tr>
			<th scope="row" class="fst">주소</th>
			<td colspan="3" id="addr">주소입력자리
			<span class="way_name">
				<span class="w_icon">도로명</span>
					<span>도로명 주소입력</span>
			</span>
			</td>
		</tr>
		<tr>
			<th scope="row" class="fst">배송 메시지</th>
			<td colspan="3" id="ship_message"> 메세지 입력</td>
		</tr>
			</tbody>
</table>

<div class="box_tit_mypage">
	<h3 class="tit_mypage tit_payment">결제 정보</h3>
</div>
<table cellspacing="0" width="100%" class="tbl_mypage_info" summary="결제 정보 - 주문금액,환불금액,결제금액">
    <caption class="none">결제 정보</caption>
    <colgroup>
        <col width="150">
        <col width="226">
        <col width="376">
    </colgroup>
    <tbody>
    <tr class="fst">
        <th scope="row" class="fst">주문금액</th>
        <td>35,200원</td>
        <td>
            상품금액 32,700원
                            + 배송비 2,500원
                    </td>
    </tr>
            <tr>
        <th scope="row" class="fst">결제금액</th>
        <td><strong class="point">35,200원</strong>
            </td>
        <td>신용카드</td>
    </tr>
    </tbody>
</table>
<a style="cursor:pointer;" onclick="history.back();return false;" class="btn_mypage btn_listview">목록보기</a>

<jsp:include page="../include/footer.jsp" flush="false" />
<script type="text/javascript">

$(document).ready(function(){
	$('.btnHelpOption').hover(function() {
		$(this).next().show();
	}
	, function() {
		$(this).next().hide();
	});
    });
</script></div>


</body>
</html>