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
	<table style="text-align: left;">
		<tr>
			<td>imp_uid</td>
			<td>
				결제금액<br/>
				(취소금액)
			</td>
			<td>구분</td>
			<td>PG사</td>
			<td>결제상세</td>
			<td>
				주문명<br/>
				구매자(이름/이메일/휴대폰/주소)
			</td>
			<td>결제시각</td>
			<td>상태</td>
		</tr>
		
		<c:forEach var="p_dto" items="${p_lists}">
			<tr>
				<td>${p_dto.imp_uid}</td>
				<td>
					${p_dto.amount}원<br/>
					(${p_dto.cancel_amount}원)
				</td>
				<td>
					${p_dto.channel}<br/>
					${p_dto.pay_method}
					</td>
				<td>${p_dto.pg_provider}</td>
				<td>
					${p_dto.card_name}<br/>
					<c:if test="${p_dto.card_quota == 0}">
					(일시불)
					</c:if>
					<c:if test="${p_dto.card_quota != 0}">
					(${p_dto.card_quota}개월)
					</c:if>
				</td>
				<td>
					${p_dto.name}<br/>
					${p_dto.buyer_name}<br/>
					${p_dto.buyer_email}<br/>
					${p_dto.buyer_tel}<br/>
					${p_dto.buyer_addr}<br/>
				</td>
				<td>${p_dto.paid_at}</td>
				<td>
				${p_dto.status}<br/>
				<c:if test="${p_dto.status == '결제완료'}">
					<input type="button" value="취소하기" class="btnGreen"/>
				</c:if>
				<c:if test="${p_dto.status == '결제취소'}">
					환불 정보 : [${p_dto.cancelled_at}] ${p_dto.cancel_amount}원
				</c:if>
				</td>
			</tr>
		
		</c:forEach>
	
	</table>
	
</c:if>

<c:if test="${empty p_lists}">
	내역이 존재하지 않습니다.
</c:if>

<jsp:include page="../include/footer.jsp" flush="false" />

</body>
</html>