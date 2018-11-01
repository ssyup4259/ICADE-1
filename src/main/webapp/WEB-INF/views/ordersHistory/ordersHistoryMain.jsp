<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/icadeStyle.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-grid.min.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-panel.css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
<title>주문 내역 조회</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<%=cp%>/resources/data/js/ordersHistoryScript.js"></script>

<script type="text/javascript">

	function cancelIt(imp_uid, o_num) {
		
		$.ajax({			
			type : "post",
			url :"<%=cp%>/payment/cancel.action",
			data : {"imp_uid":imp_uid, "o_num":o_num},
			datatype : "text",
			success:function(data){
				alert(data);
				cancelOK(data);
			},
			error: function(data) {
				alert("error");
				alert(data);
			}
		});
	
	}
	
	function cancelOK(o_num) {
		
		$.ajax({			
			type : "post",
			url :"<%=cp%>/payment/cancelOK.action",
			data : {"o_num":o_num},
			datatype : "text",
			success:function(data){
				alert("Yeah");
				
				if (data == "success") {
					alert("LOL");
				}
				console.log(data);
			},
			error: function(data) {
				alert("error");
				alert(data);
			}
		});
		
	}

</script>

</head>
<body>

<jsp:include page="../include/header.jsp" flush="false" />

<div id="container">
        <div id="contents">
            
<div class="titleArea">
    <h2>주문조회</h2>
</div>

<form method="post" id="OrderHistoryForm" name="OrderHistoryForm">

<div class="xans-element- xans-myshop xans-myshop-orderhistoryhead ">

<fieldset class="ec-base-box">
	<legend>검색기간설정</legend>
			<!-- 오늘,1주일,1개월,3개월,6개월 이미지 버튼 -->
	        <span class="period">
	            <a href="#none" class="btnNormal" days="00"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date1_on.gif" id="today" alt="오늘"></a>
	            <a href="#none" class="btnNormal" days="07"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date2.gif" id="oneWeek" alt="1주일"></a>
	            <a href="#none" class="btnNormal" days="30"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date3.gif" id="oneMonth" alt="1개월"></a>
	            <a href="#none" class="btnNormal" days="90"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date4.gif" id="threeMonth" alt="3개월"></a>
	            <a href="#none" class="btnNormal" days="180"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date5.gif" id="sixMonth" alt="6개월"></a>
	        </span>
	        <!-- 기간 지정부분 -->
	        <!-- <input id="history_start_date" name="history_start_date" class="fText hasDatepicker" readonly="readonly" size="10" value="2018-07-21" type="text">
	        	달력 버튼
	        	<button type="button" class="ui-datepicker-trigger" ><img src="//img.echosting.cafe24.com/skin/admin_ko_KR/myshop/ico_cal.gif" alt="..." title="..."></button> -->
	        	
	        <input type="text" id="sdate" name="startDay"> ~ <input type="text" id="edate" name="endDay"> 
	        
	        <!-- 
	        <input id="history_end_date" name="history_end_date" class="fText hasDatepicker" readonly="readonly" size="10" value="2018-10-19" type="text">
	        	<button type="button" class="ui-datepicker-trigger" ><img src="//img.echosting.cafe24.com/skin/admin_ko_KR/myshop/ico_cal.gif" alt="..." title="..."></button> -->        
	        <!-- 조회 버튼 -->
	        <input alt="조회" id="order_search_btn" type="image" src="//img.echosting.cafe24.com/skin/admin_ko_KR/myshop/btn_search.gif">
</fieldset>

<ul>
	<li>기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 지난 주문내역을 조회하실 수 있습니다.</li>
		<br/><!-- 태그 안먹어서 임시로 띄어쓰기 -->
	<li>주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.</li>
</ul>

</div>

</form>

<div class="xans-element- xans-myshop xans-myshop-orderhistorylistitem ec-base-table typeList">

<div class="title">
        <h3>주문 상품 정보</h3>
</div>

<table border="1" style="width: 70%;">
<caption>주문 상품 정보</caption>
<colgroup>
	<col style="width:135px;">
	<col style="width:93px;">
	<col style="width:150px;">
	<col style="width:61px;">
	<col style="width:111px;">
	<col style="width:111px;">
	<col style="width:111px;">
</colgroup>

<thead>
	<tr>
		<th scope="col">주문일자<br>[주문번호]</th>
		<th scope="col">이미지</th>
		<th scope="col">상품정보</th>
		<th scope="col">수량</th>
		<th scope="col">상품구매금액</th>
		<th scope="col">주문처리상태</th>
		<th scope="col">취소/교환/반품</th>
	</tr>
</thead>


		<tbody class="center ">
<c:forEach var="map" items="${hashMap}">
	<c:forEach var="dto" items="${map.value }">
			<tr class="xans-record-">
				<td class="gubun">
					<p>${dto.getO_DATE()}<br/>
						<a href="ordersHistoryDetail.action?o_num=${dto.getO_NUM()}" class="line">[${dto.getO_NUM()}]</a>
					</p>
					<a href="#none" class="line" onclick="location.href='ordersHistoryDetail.action?o_num=${dto.getO_NUM()}'">[상세정보]</a>
				</td>
				<td class="thumb">
					<a href="/icade/goods/goodsArticle.action?G_NUM=${dto.getGD_NUM()}">
						<img src="/icade/resources/goodsImage/${dto.getG_SAVEFILENAME()}" width="80" height="80">
					</a>
				</td>
			       <td class="product left top">
					<a href="/icade/goods/goodsArticle.action?G_NUM=${dto.getGD_NUM()}">
						<strong>${dto.getOD_NAME()}</strong>
					</a>
						<div class="option ">[옵션: ${dto.getOD_NAME()}-${dto.getOD_DEVICE()}-${dto.getOD_COLOR()}]</div>
				</td>
				
				<td>${dto.getOD_COUNT()}</td>
				
				<td class="right">
					<strong><fmt:formatNumber>${dto.getOD_PRICE()}</fmt:formatNumber>원</strong>
				</td>
				
				<td class="state">
					<p class="txtEm">${dto.getO_STATUS()}</p>
				</td>
				
				<td class="gubun">
					<form action="" method="post" name="myForm">
						<input type="button" value="환불 하기" onclick="cancelIt('${dto.getO_IMP()}',${dto.getO_NUM()});"/>
					</form>
					<p class="">${dto.getO_IMP()}</p>
				</td>
				
			</tr>
	</c:forEach> 
</c:forEach>			
		</tbody>

</table>

<c:if test="${empty lists}">
<p class="message ">주문 내역이 없습니다.</p>
</c:if>
</div>

<br/><br/>

<input type="hidden" name="nextIndex" value="">

<table align="center">
	<tr>
		<td>
			<c:if test="${dataCount!=0 }">
		${pageIndexList}
	</c:if>
			<c:if test="${dataCount==0}">
		주문 내역이 없습니다.
			</c:if>

		</td>
	</tr>
</table>

<jsp:include page="../include/footer.jsp" flush="false" />
</body>
</html>