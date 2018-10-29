<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<%=cp%>/resources/data/js/ordersHistoryScript.js"></script>
</head>
<body>

<div id="container">
        <div id="contents">
            
<div class="titleArea">
    <h2>주문조회</h2>
</div>

<div class="xans-element- xans-myshop xans-myshop-orderhistorytab ec-base-tab ">
	<ul class="menu">
		<li class="selected"><a href="/myshop/order/list.html?history_start_date=2018-07-21&amp;history_end_date=2018-10-19">주문내역조회 (0)</a></li>
        <li class=""><a href="/myshop/order/list.html?mode=cs&amp;history_start_date=2018-07-21&amp;history_end_date=2018-10-19">취소/반품/교환 내역 (0)</a></li>
        <li class=" displaynone"><a href="/myshop/order/list_old.html?mode=old&amp;history_start_date=2018-07-21&amp;history_end_date=2018-10-19">이전 주문내역 (0)</a></li>
    </ul>
</div>

<form method="post" id="OrderHistoryForm" name="OrderHistoryForm">

<div class="xans-element- xans-myshop xans-myshop-orderhistoryhead ">

<fieldset class="ec-base-box">
	<legend>검색기간설정</legend>
	        <!-- <div class="stateSelect ">
	            <select id="order_status" name="order_status" class="">
					<option value="all">전체 주문처리상태</option>
					<option value="shipped_before">입금전</option>
					<option value="shipped_standby">배송준비중</option>
					<option value="shipped_begin">배송중</option>
					<option value="shipped_complate">배송완료</option>
					<option value="order_cancel">취소</option>
					<option value="order_exchange">교환</option>
					<option value="order_return">반품</option>
				</select>       
	
			</div> -->
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
	<li>주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.</li>
</ul>

</div>

</form>

<div class="xans-element- xans-myshop xans-myshop-orderhistorylistitem ec-base-table typeList"><!--
        $login_url = /member/login.html
    -->

<div class="title">
        <h3>주문 상품 정보</h3>
</div>
    
    


<table border="1" summary="">
<caption>주문 상품 정보</caption>
<colgroup>
	<col style="width:135px;">
	<col style="width:93px;">
	<col style="width:auto;">
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


<c:forEach items="${lists }" var="dto">

<input type="hidden" id="temp" value="${dto.getO_NUM()}">

<tbody class="center ">
	<tr class="xans-record-">
	</c:forEach>
	<c:forEach items="${detailList}" var="Ddto">
		<td rowspan="${fn:length(lists)}" class="number ">
			2018-10-29
			<p><a href="detail.html?order_id=20181029-0004189&amp;page=1&amp;history_start_date=2018-07-31&amp;history_end_date=2018-10-29" class="line">[20181029-0004189]</a></p>
	        <a href="#none" class="displaynone" onclick="OrderHistory.orderCancel('20181029-0004189')"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_order_cancel.gif" alt="주문취소"></a>
	        <a href="cancel.html?order_id=20181029-0004189" class="displaynone button"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_order_cancel2.gif" alt="취소신청"></a>
	        <a href="exchange.html?order_id=20181029-0004189" class="displaynone button"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_order_exchange.gif" alt="교환신청"></a>
	        <a href="return.html?order_id=20181029-0004189" class="displaynone button"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_order_return.gif" alt="반품신청"></a>
		</td>
		
		<td class="thumb"><a href="/product/detail.html?product_no=850&amp;cate_no=70"><img src="/icade/resources/goodsImage/이미지" onerror="this.src='//img.echosting.cafe24.com/thumb/img_product_small.gif';" alt=""></a></td>
	       <td class="product left top">
			<a href="/product/detail.html?product_no=850&amp;cate_no=70"><strong>슈팅스타 LED 케이블</strong></a>
				<div class="option ">[옵션: 스카이블루]</div>
					<p class="gBlank5 displaynone">무이자할부 상품</p>
		</td>
		<td>1</td>
		<td class="right">
			<strong>₩14,900</strong>
			<div class="displaynone"></div>
		</td>
		<td class="state">
			<p class="txtEm">입금전취소</p>
			<p class="displaynone"><a href="#" target="_self"></a></p>
			<p class="displaynone"><a href="#none" class="line" onclick="">[]</a></p>
			<a href="/board/product/write.html?board_no=4&amp;product_no=850&amp;order_id=20181029-0004189" class=""><img src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_order_comment.gif" alt="구매후기"></a>
			<a href="#none" class="displaynone" onclick="OrderHistory.withdraw('C','20181029-0004189|850|000A|580959','F')"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_order_retract.gif" alt="취소철회"></a>
			<a href="#none" class="displaynone" onclick="OrderHistory.withdraw('E','20181029-0004189|850|000A|580959','F')"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_order_retract2.gif" alt="교환철회"></a>
			<a href="#none" class="displaynone" onclick="OrderHistory.withdraw('R','20181029-0004189|850|000A|580959','F')"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_order_retract3.gif" alt="반품철회"></a>
		</td>
		<td>
			<p class="displaynone"><a href="#none" class="line" onclick="OrderHistory.getDetailInfo('?product_no=850&amp;cate_no=70&amp;order_id=20181029-0004189&amp;ord_item_code=20181029-0004189-01');">[상세정보]</a></p>
			<p class="">-</p>
		</td>
	</tr>
	</c:forEach>
</tbody>

<%-- 

<tbody class="center displaynone">
	<tr class="">
		<td class="number displaynone" rowspan="${fn:length(lists)}">
			<p><a href="ordersHistoryDetail.action?o_num=${dto.getO_NUM()}" style="text-decoration:none" class="line">${dto.getO_DATE()}<br/>[${dto.getO_NUM()}]</a></p>
			<a href="#none" class="displaynone" onclick=""><img src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_order_cancel.gif" alt="주문취소"></a>
			<a href="cancel.html" class="displaynone button"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_order_cancel2.gif" alt="취소신청"></a>
			<a href="exchange.html" class="displaynone button"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_order_exchange.gif" alt="교환신청"></a>
			<a href="return.html" class="displaynone button"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_order_return.gif" alt="반품신청"></a>
		</td>
		
		<td class="thumb">
			<a href="/icade/resources/goodsImage/"><img src="/" onerror="this.src='//img.echosting.cafe24.com/thumb/img_product_small.gif';" alt="">${Ddto.getG_SAVEFILENAME()}</a>
		</td>
		
		
		<td class="product left top">
			<a href="/product/detail.html"><strong>${Ddto.getOD_NAME()}</strong></a>
			<div class="option displaynone">[옵션: ]</div>
			<ul class="xans-element- xans-myshop xans-myshop-optionset option">
				<li class=""><strong></strong> (개)</li><!-- 하나의 제품 보여주고 외 몇개 또는 모든 재품 보여주기 고민 -->
			</ul>
	<!-- <p class="gBlank5 displaynone">무이자할부 상품</p> -->
		</td>
		<td>${dto.getO_COUNT()} </td>
		<td class="right">
			<strong>${dto.getO_TOT()}</strong>
			<div class="displaynone"></div>
		</td>
		<td class="state">
			<p class="txtEm"></p>
			<p class="displaynone"><a href="" target=""></a></p>
			<p class="displaynone"><a href="#none" class="line" onclick="">[]</a></p>
			<a href="/board/product/write.html" class="displaynone"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_order_comment.gif" alt="구매후기"></a>
			<a href="#none" class="displaynone" onclick=""><img src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_order_retract.gif" alt="취소철회"></a>
			<a href="#none" class="displaynone" onclick=""><img src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_order_retract2.gif" alt="교환철회"></a>
			<a href="#none" class="displaynone" onclick=""><img src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_order_retract3.gif" alt="반품철회"></a>
		</td>
		<td>
			<p class="displaynone">
			<a href="#none" class="line" onclick="">[상세정보]</a></p>
			<p class="displaynone">-</p>
		</td>
	</tr>


</tbody>
--%>
</table>

<c:if test="${empty lists}">
<p class="message ">주문 내역이 없습니다.</p>
</c:if>
</div>

<div class="xans-element- xans-myshop xans-myshop-orderhistorypaging ec-base-paginate"><a href="?page=1&amp;history_start_date=2018-07-21&amp;history_end_date=2018-10-19" class="first"><img src="//img.echosting.cafe24.com/skin/base/common/btn_page_first.gif" alt="첫 페이지"></a>
<a href="?page=1&amp;history_start_date=2018-07-21&amp;history_end_date=2018-10-19"><img src="//img.echosting.cafe24.com/skin/base/common/btn_page_prev.gif" alt="이전 페이지"></a>
<ol>
<li class="xans-record-"><a href="?page=1&amp;history_start_date=2018-07-21&amp;history_end_date=2018-10-19" class="this">1</a></li>
            </ol>
<a href="?page=1&amp;history_start_date=2018-07-21&amp;history_end_date=2018-10-19"><img src="//img.echosting.cafe24.com/skin/base/common/btn_page_next.gif" alt="다음 페이지"></a>
<a href="?page=1&amp;history_start_date=2018-07-21&amp;history_end_date=2018-10-19" class="last"><img src="//img.echosting.cafe24.com/skin/base/common/btn_page_last.gif" alt="마지막 페이지"></a>
</div>
        </div>
        <hr class="layout"><div id="background"></div>

    </div>


</body>
</html>