<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<style type="text/css">
.lg img {
	width: 60px;
	height: 60px;
	border-radius: 12px;
}
</style>


<script type="text/javascript">
	jQuery(document).ready(function() {
		var offset = 220;
		var duration = 500;
		jQuery(window).scroll(function() {
			if (jQuery(this).scrollTop() > offset) {
				jQuery('.back_to_top').fadeIn(duration);
				jQuery('.latestGoods').fadeIn(duration);
			} else {
				jQuery('.back_to_top').fadeOut(duration);
				jQuery('.latestGoods').fadeOut(duration);
			}
		});
		
		jQuery('#mm').hover(function(){
			jQuery('.latestGoods').fadeOut(duration);
		})

		jQuery('.back_to_top').click(function(event) {
			event.preventDefault();
			jQuery('html, body').animate({
				scrollTop : 0
			}, duration);
			return false;
		})

	});
</script>

<script type="text/javascript">

	function sendIt(g_num) {
		
		
		
		var f = document.searchForm;
		
		f.action = "<%=cp%>/goods/cookieDelete.action?g_num=" + g_num;
		f.submit()
		
	} 

</script>
<script type="text/javascript">
        $(document).ready(function(){

            //Check if the current URL contains '#' 
            if(document.URL.indexOf("#")==-1)
            {
                // Set the URL to whatever it was plus "#".
                url = document.URL+"#";
                location = "#";

                //Reload the page
                location.reload(true);

            }
        });
    </script> 


<input type="button" class="btn back_to_top" value="맨위로" style="width: 70px;">

<div class="latestGoods">
	<div class="lg text-center" style="width: 70px; height: 750px; border: 2px solid #A3C838; border-radius: 12px;">
		<h3>최근 본</h3>
		<input type="button" value=" 전체 삭제 " class="btn2" onclick="javascript:location.href='<%=cp%>/goods/cookieDelete_ok.action';"/>
		<form action="" name="searchForm" method="post">
		<c:forEach var="ck" items="${ck_lists}">
		<img src="<%=cp%>/resources/goodsImage/${ck.getG_SAVEFILENAME()}" width="100" height="100"><br/><br/>
		<input type="button" value=" 삭제 " class="btn2" onclick="sendIt(${ck.getG_NUM()});"/>
		<br/><br/>
		</c:forEach>

		</form>
		<h3>찜한</h3>
		<img src="/icade/resources/data/img/sample.jpg">
		<img src="/icade/resources/data/img/sample1.jpg">
		<img src="/icade/resources/data/img/sample.jpg">
		<img src="/icade/resources/data/img/sample1.jpg">
		<img src="/icade/resources/data/img/sample.jpg">
	</div>
</div>
<div class="container-fluid footer" style="width: 100%; height: 300px; background-color: white;">
	<div class="row text-center">
		<div class="col-sm-3 " style="text-align: right;">
			<h2>CUSTOMER CALL</h2>
			<p>02-1234-5678</p>
			<p>월 ~ 금 AM 10:00 ~ PM 06:00</p>
			<p>점심시간 PM 12:00 ~ PM 01:00</p>
			<p>주말&공휴일은 쉽니다</p>
		</div>
		<div class="col-sm-3" style="text-align: center;">
			<h2>BANKING ACCOUNT INFO</h2>
			<p>입금 계좌번호 (예금주 : 주식회사아이케이드)</p>
			<p>국민 839837-01-003167&nbsp;&nbsp;&nbsp;&nbsp;신한 140-011-941685</p>
			<p>농협 355-0052-1866-13&nbsp;&nbsp;&nbsp;&nbsp;기업 1670-4474-00</p>
		</div>
		<div class="col-sm-3" style="text-align: center;">
			<h2>INFO MENU</h2>
			<a href="">고객센터</a>
			<br>
			<a href="">공지사항</a>
			<br>
			<a href="">입사지원</a>
			<br>
			<a href="">주문조회</a>
			<br>
		</div>
		<div class="col-sm-3" style="text-align: left;">
			<h2>반품주소</h2>
			<p>서울특별시 강남구 테헤란로 123 여삼빌딩 15층</p>
		</div>
	</div>
	<div class="text-center">
		<h3>주식회사 아이케이드</h3>
	</div>
	<div class="text-center" style="font-size: 13px;">
		사업자 등록번호 안내 : 523-81-00706 [사업자정보확인]통신판매업 신고 2017-강남-0606 전화 : 02-1234-5678 주소 : 서울특별시 강남구 테헤란로 123 여삼빌딩 15층
		<br>
		개인정보보호책임자 : 서영욱(admin@i-m-all.com)Hosting by 심플렉스인터넷(주)Copyright © 2018 아이케이드. All rights reserved. 반품 : 서울특별시 강남구 테헤란로 123 여삼빌딩 15층
		<br>
		안전한 상거래를 위해 KB에스크로 이체 구매 안전 서비스를 이용하실 수 있습니다.[KB에스크로 이체 판매자 정보확인]
		<br>
		<br>
		<br>
	</div>
</div>