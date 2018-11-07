<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String cp = request.getContextPath();
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-grid.min.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-panel.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/icade.css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

<script src="<%=cp%>/resources/data/js/bootstrap.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>


<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<!-- daum api -->
<!--autoload=false 파라미터를 이용하여 자동으로 로딩되는 것을 막습니다.-->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script charset="UTF-8" type="text/javascript" src="http://t1.daumcdn.net/postcode/api/core/180928/1538455030985/180928.js"></script>

</head>
<script>
$(function () {

    $(".tab_content").hide();

    $("ul.tabs li").click(function () {
        $("ul.tabs li").removeClass("active").css("color", "#333");
        //$(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
        $(this).addClass("active").css("color", "darkred");
        $(".tab_content").hide()
        var activeTab = $(this).attr("rel");
        $("#" + activeTab).fadeIn()
    });
});

</script>
<body>
<jsp:include page="../include/header.jsp" flush="false" />



<div id="container">
    <ul class="tabs">
        <li class="active" rel="tab1">주문결제</li>
        <li rel="tab2">배송</li>
        <li rel="tab3">교환/환불</li>
        <li rel="tab4">적립금/혜택</li>
    </ul>
    <div class="tab_container">
    	<!-- 주문결제 -->
        <div id="tab1" class="dropdown-content">
            <ul>
               <li><a href="#">
               주문방법 
상품검색 → 장바구니에 담기 → 회원ID 로그인 또는 비회원 주문 → 주문서 작성 → 결제방법선택 및 결제 → 주문 성공 화면 (주문번호)
※비회원 주문인경우 6단계에서 주문번호와 승인번호(카드결제시)를 꼭 메모해 두시기 바랍니다. 단, 회원인 경우 자동 저장되므로 따로 관리하실 필요가 없습니다.※
               
               </a></li>
            </ul>
        </div>
        <!-- #tab1 -->
        <div id="tab2" class="dropdown-content"></div>
        <!-- #tab2 -->
        <div id="tab3" class="dropdown-content"></div>
        <!-- #tab3 -->
         <div id="tab4 " class="dropdown-content"></div>
        <!-- #tab4 -->
    </div>
    <!-- .tab_container -->
</div>
<!-- #container -->


<jsp:include page="../include/footer.jsp" flush="false" />
</body>
</html>