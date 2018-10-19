<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String cp = request.getContextPath(); %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>마이 쇼핑</h1>

<div class=""><ul>
<li class=" ">
            <strong class="title">가용적립금</strong>
            <strong class="data use">&nbsp;<span id="xans_myshop_bankbook_avail_mileage">2,700원</span></strong>
            <a href="/myshop/mileage/historyList.html" class="button"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_result.gif" alt="조회"></a>
        </li>
        <li class="">
            <strong class="title">총적립금</strong>
            <strong class="data"><span id="xans_myshop_bankbook_total_mileage">2,700원</span></strong>
        </li>
        <li class="">
            <strong class="title">사용적립금</strong>
            <strong class="data"><span id="xans_myshop_bankbook_used_mileage">0원</span></strong>
        </li>
        <li class="displaynone">
           <strong class="title"></strong>
           <strong class="data use">&nbsp;</strong>
           <a href="/myshop/deposits/historyList.html" class="button"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_result.gif" alt="조회"></a>
        </li>
        <li>
            <strong class="title">총주문</strong>
            <strong class="data"><span id="xans_myshop_bankbook_order_price">0원</span>(<span id="xans_myshop_bankbook_order_count">0</span>회)</strong>
        </li>
        <li class="">
            <strong class="title">쿠폰</strong>
            <strong class="data"><span id="xans_myshop_bankbook_coupon_cnt"></span><span>개</span></strong>
            <a href="/myshop/coupon/coupon.html" class="button"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_result.gif" alt="조회"></a>
        </li>
    </ul>
</div>

등	  급 : ${sessionScope.userInfo.getM_RANK()} <br/>
아 이 디 : ${sessionScope.userInfo.getM_ID()} <br/>
닉 네 임 : ${sessionScope.userInfo.getM_NICKNAME()} <br/>
이    름 : ${sessionScope.userInfo.getM_NAME()} <br/>
주	  소 : ${sessionScope.userInfo.getM_ZIPCODE()} ${sessionScope.userInfo.getM_ADDRESS1()} ${sessionScope.userInfo.getM_ADDRESS2()} <br/>
이 메 일 : ${sessionScope.userInfo.getM_EMAIL_ID()}@${sessionScope.userInfo.getM_EMAIL_DOMAIN()} <br/>
전화번호 : ${sessionScope.userInfo.getM_CELLPHONE1()}-${sessionScope.userInfo.getM_CELLPHONE2()}-${sessionScope.userInfo.getM_CELLPHONE3()} <br/>
포 인 트 : ${point} <br/>
가 입 일 : ${sessionScope.userInfo.getM_DATE()} <br/>
<br/>
<a href="changeInfo.action"><input type="button" value="정보수정"></a>&nbsp;<a href="cancelMembership.action"><input type="button" value="회원탈퇴"></a>  


</body>
</html>