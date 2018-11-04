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
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/icade.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-grid.min.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-panel.css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

<script src="<%=cp%>/resources/data/js/bootstrap.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>구매/환불 내역</title>
</head>
<body>

<jsp:include page="../include/header.jsp" flush="false" />

<h1>주문 내역 조회</h1>

<c:if test="${!empty p_lists}">
	<c:forEach var="p_dto" items="${p_lists}">
	아임포트 결제 고유 UID : ${p_dto.imp_uid}<br/>
	결제 수단 : ${p_dto.pay_method}<br/>
	결제 경로 : ${p_dto.channel}<br/>
	PG사 명칭 : ${p_dto.pg_provider}<br/>
	주문 명칭 : ${p_dto.name}<br/>
	결제 금액 : ${p_dto.amount}<br/>
	결제 취소 금액 : ${p_dto.cancel_amount}<br/>
	주문자명 : ${p_dto.buyer_name}<br/>
	주문자 메일 : ${p_dto.buyer_email}<br/>
	주문자 전화번호 : ${p_dto.buyer_tel}<br/>
	주문자 주소 : ${p_dto.buyer_addr}<br/>
	주문자 우편번호 : ${p_dto.buyer_postcode}<br/>
	결제 상태 : ${p_dto.status}<br/>
	결제 시각 : ${p_dto.paid_at}<br/>
	환불 시각 : ${p_dto.cancelled_at}<br/>
	카드사 : ${p_dto.card_name}<br/>
	할부개월 : ${p_dto.card_quota}<br/>
	
	<br/><br/>
	</c:forEach>
</c:if>

<c:if test="${empty p_lists}">
	내역이 존재하지 않습니다.
</c:if>

<jsp:include page="../include/footer.jsp" flush="false" />

</body>
</html>